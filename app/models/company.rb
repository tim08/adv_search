require 'digest/md5'

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
  has_many :articles
  before_create do
    self.date_foundation = Date.current
    self.ref_code = Digest::MD5.hexdigest(DateTime.now.to_s)
  end

  has_attached_file :logo, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
  validates_with AttachmentSizeValidator, attributes: :logo, less_than: 15.megabytes

  scope :verified, -> { where(verified: true) }
  scope :premium, -> { verified.where('expiration_date_of_premium > ?', DateTime.now) }

  SPECIALIZATION_TYPES = %w[promo
    outdoor_ads
    direct_mail
    transport_ads
    indoor_ads
    mass_media
    tv_ads
    internet_ids
    salepoint_ads
    print_services
    production_promotional_materials
    install_adv_constructions
    marketing_research
    product_placement
    professional_photography
    marketing_automation
    design_services
    radio_ads].freeze

  after_create{ NotificationMailer.notification_company.deliver_later}

  def self.search(params)
    result = {companies: none, message: '', add_link: false}
    if params[:city].present?
      companies = all

      companies = companies.where("#{params[:adv_class]} = 1")
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
          result[:add_link] = true
        end
      end

    else
      result[:companies] = verified.last(5).reverse
      result[:message] = I18n.t('search_message.last_companies')
    end
    result
  end

  def self.news_projects
    Project.joins(:company).where(companies: {verified: true}).last(3)
  end

  def self.reviews_main
    verified.joins(:reviews).where(reviews: {verified: true}).distinct.last(3)
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

  def specialization_to_s
    spec_s = []
    SPECIALIZATION_TYPES

    SPECIALIZATION_TYPES.each do |sp|
      spec_s << I18n.t("activerecord.attributes.company.#{sp}") if self.public_send(sp).present?
    end
    spec_s
  end

  def specialization
    spec = []
    SPECIALIZATION_TYPES.each do |sp|
      spec << sp if self.public_send(sp).present?
    end
    spec
  end

  def self.generate_ref_codes
    all.each do |c|
      c.update_column(:ref_code, Digest::MD5.hexdigest(DateTime.now.to_s + name)) if c.ref_code.nil?
    end
  end

end
