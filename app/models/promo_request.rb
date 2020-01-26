class PromoRequest < ApplicationRecord

  paginates_per 6

  validates :name, :min_order_price, :description,
            :contact_details, presence: true

  belongs_to :city
  belongs_to :company, optional: true

  after_create{ NotificationMailer.with(promo_request: self).notification_request.deliver_later}

  enum status: [:unhandled, :free, :processing, :closed]

  scope :verified, -> {where.not(status: :unhandled).order(created_at: :desc)}
  scope :non_closed, -> {where.not(status: :closed).order(created_at: :desc)}
  scope :only_free, -> { where(status: :free).order(created_at: :desc) }

  DELAY_FOR_NORMAL_ACCOUNT = 60

  ADV_TYPES = {promo: 'Промо акции и мероприятия',
               direct_mail: 'Директ мэйл',
               outdoor_ads: 'Наружная реклама',
               transport_ads: 'Реклама на транспорте',
               tv_ads: 'Телевизионная реклама',
               radio_ads: 'Реклама на радиостанциях',
               mass_media: 'Информационные печатные СМИ',
               indoor_ads: 'Indoor реклама',
               internet_ids: 'Интернет реклама',
               print_services: 'Полиграфические услуги',
               product_placement: 'Продакт-плейсмент',
               salepoint_ads: 'Реклама в местах продаж',
               design_services: 'Дизайнерские услуги',
               marketing_research: 'Маркетинговые исследования',
               marketing_automation: 'Автоматизация маркетинга',
               professional_photography: 'Профессиональная фотосъёмка',
               production_promotional_materials: 'Изготовление рекламных материалов',
               install_adv_constructions: 'Монтаж рекламных конструкций'}.freeze

  def adv_type_str
    ADV_TYPES[adv_type.to_sym]
  end

  def self.search_free(company)
    only_free.joins(:city).where(cities: { id: company.cities.ids }).where(adv_type: company.specialization)
  end

  def self.search(params)
    params[:city].present? ? verified.joins(:city).where(cities: {id: params[:city]}) : verified
  end

end
