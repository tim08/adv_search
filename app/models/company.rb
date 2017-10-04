class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :cities
  has_many :projects, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_attached_file :logo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  scope :verified, -> {where(verified: true)}

  def self.search(params)
    result = { companies: none, message: '' }
    if params[:city].present?
      companies = joins(:cities)
                      .where(cities: {id: params[:city]})
                      .where(min_order_price: 0..params[:min_order_price].to_i)
      if companies.present?
        result[:companies] = companies
        result[:message] = 'Компании соответствующие вашему запросу'
      else
        companies_cities = joins(:cities).where(cities: {id: params[:city]})
        if companies_cities.present?
          result[:companies] = companies_cities
          result[:message] = 'В данных момент компании с установленным  Вами бюджетом отсутствуют,
                               обратите внимания на следующие компании'
        else
          result[:message] = 'Извините в данных момент компании из этого города отсутствуют'
        end
      end

    else
      result[:companies] = verified.last(5).reverse
      result[:message] = 'Последние компании'
    end
    result
  end

  def self.news_projects
    verified.joins(:projects).distinct.last(3)
  end

  def self.reviews_main
    verified.joins(:reviews).distinct.last(3)
  end
end
