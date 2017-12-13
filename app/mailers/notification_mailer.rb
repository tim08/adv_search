class NotificationMailer < ApplicationMailer

  ADMIN_EMAIL = 'promowindin@gmail.com'

  def notification_request
    @promo_request = params[:promo_request]
    mail(to: ADMIN_EMAIL, subject: 'PromoWind: Новая заявка')
  end

  def notification_company
    mail(to: ADMIN_EMAIL, subject: 'PromoWind: зарегистрировалась новая компания')
  end

end
