class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :cities
  has_many :projects, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :promo_requests
  has_many :premium_payments

  has_attached_file :logo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  scope :verified, -> { where(verified: true) }
  scope :premium, -> { verified.where('expiration_date_of_premium > ?', DateTime.now) }

  after_create{ NotificationMailer.notification_company.deliver_later}

  def self.search(params)
    result = {companies: none, message: ''}
    if params[:city].present?
      companies = all
      companies = companies.where(promo: true) if params[:promo].present?
      companies = companies.where(outdoor_ads: true) if params[:outdoor_ads].present?
      companies = companies.where(direct_mail: true) if params[:direct_mail].present?
      companies = companies.where(transport_ads: true) if params[:transport_ads].present?
      companies = companies.where(indoor_ads: true) if params[:indoor_ads].present?
      companies = companies.where(mass_media: true) if params[:mass_media].present?
      companies = companies.where(tv_ads: true) if params[:tv_ads].present?
      companies = companies.where(internet_ids: true) if params[:internet_ids].present?
      companies = companies.where(salepoint_ads: true) if params[:salepoint_ads].present?
      companies = companies.where(print_services: true) if params[:print_services].present?
      companies = companies.where(salepoint_ads: true) if params[:salepoint_ads].present?
      companies = companies.where(production_promotional_materials: true) if params[:production_promotional_materials].present?
      companies = companies.where(install_adv_constructions: true) if params[:install_adv_constructions].present?
      companies = companies.where(marketing_research: true) if params[:marketing_research].present?
      companies = companies.where(product_placement: true) if params[:product_placement].present?
      companies = companies.where(design_services: true) if params[:design_services].present?
      companies = companies.where(radio_ads: true) if params[:radio_ads].present?
      companies_with_city_and_price = companies.verified.joins(:cities)
                                          .where(cities: {id: params[:city]})
                                          .where(min_order_price: 0..params[:min_order_price].to_i)

      if companies_with_city_and_price.present?
        result[:companies] = companies_with_city_and_price
        result[:message] = I18n.t('search_message.companies_matching')
      else
        companies_only_city = companies.verified.joins(:cities).where(cities: {id: params[:city]})
        if companies_only_city.present?
          result[:companies] = companies_only_city
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
    verified.joins(:projects).distinct.last(3).reverse
  end

  def self.reviews_main
    verified.joins(:reviews).distinct.last(3)
  end

  def premium?
    DateTime.now < expiration_date_of_premium
  end

  def activate_premium!(params)
    update_column(:expiration_date_of_premium, DateTime.now + 3.months)
    pp = premium_payments.build
    pp.amount = params[:amount]
    pp.uid = params[:order_id]
    pp.save
  end
end
