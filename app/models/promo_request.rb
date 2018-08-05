class PromoRequest < ApplicationRecord

  validates :name, :min_order_price, :description,
            :contact_details, presence: true

  belongs_to :city
  belongs_to :company, optional: true

  after_create{ NotificationMailer.with(promo_request: self).notification_request.deliver_later}

  enum status: [:unhandled, :free, :processing, :closed]

  scope :verified, -> {where.not(status: :unhandled).order(created_at: :desc)}
  scope :only_free, -> { where(status: :free).order(created_at: :desc) }

  DELAY_FOR_NORMAL_ACCOUNT = 60

  ADV_TYPES = {promo: 'Промо акции и мероприятия',
               outdoor_ads: 'Наружная реклама',
               direct_mail: 'Директ мэйл',
               transport_ads: 'Реклама на транспорте',
               indoor_ads: 'Indoor реклама',
               mass_media: 'Информационные печатные СМИ',
               tv_ads: 'Телевизионная реклама',
               internet_ids: 'Интернет реклама',
               salepoint_ads: 'Реклама в местах продаж',
               print_services: 'Полиграфические услуги',
               production_promotional_materials: 'Изготовление рекламных материалов',
               install_adv_constructions: 'Монтаж рекламных конструкций',
               marketing_research: 'Маркетинговые исследования',
               product_placement: 'Продакт-плейсмент',
               design_services: 'Дизайнерские услуги',
               radio_ads: 'Реклама на радиостанциях'}.freeze

  def adv_type_str
    ADV_TYPES[adv_type.to_sym]
  end

  def self.search_free(company)
    only_free.joins(:city).where(cities: { id: company.cities.ids }).where(adv_type: company.specialization)
  end

end
