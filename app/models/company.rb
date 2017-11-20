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
    result = {companies: none, message: ''}
    if params[:city].present?
      companies = verified.joins(:cities)
                      .where(cities: {id: params[:city]})
                      .where(min_order_price: 0..params[:min_order_price].to_i)
      if companies.present?
        result[:companies] = companies
        result[:message] = I18n.t('search_message.companies_matching')
      else
        companies_cities = verified.joins(:cities).where(cities: {id: params[:city]})
        if companies_cities.present?
          result[:companies] = companies_cities
          result[:message] = I18n.t('search_message.companies_budget_missing')
        else
          result[:message] = I18n.t('search_message.companies_missing')
        end
      end

    else
      result[:companies] = verified.last(5).reverse
      result[:message] = I18n.t('search_message.last_companies')
    end
    result
  end

  def self.news_projects
    verified.joins(:projects).distinct.last(3)
  end

  def self.reviews_main
    verified.joins(:reviews).distinct.last(3)
  end

  def premium?
    DateTime.now < expiration_date_of_premium
  end
end
