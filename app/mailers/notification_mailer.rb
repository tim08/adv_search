class NotificationMailer < ApplicationMailer

  ADMIN_EMAIL = 'promowindin@gmail.com'

  def notification_request
    @promo_request = params[:promo_request]
    mail(to: ADMIN_EMAIL, subject: 'PromoWind: Новая заявка')
  end

  def notification_company
    mail(to: ADMIN_EMAIL, subject: 'PromoWind: зарегистрировалась новая компания')
  end

  def notification_new_promo_request
    @promo_request = params[:promo_request]
    mail(to: Company.joins(:cities).where(cities: {name: @promo_request.city.name}).pluck(:email), subject: 'Новая заявка на сайте PromoWind.ru')
  end

end
