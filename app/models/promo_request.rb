class PromoRequest < ApplicationRecord

  ADV_TYPES = {promo: 'Промо акции и мероприятия',
   name: 'Название',
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
   radio_ads: 'Реклама на радиостанциях'}

end
