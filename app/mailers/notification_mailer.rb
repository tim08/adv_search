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
    @company = params[:company]
    mail(to: @company.email, subject: 'Новая заявка на сайте PromoWind.ru')
  end

  def notification_company_after_verify_admin
    @company = params[:company]
    mail(to: @company.email, subject: 'PromoWind: Ваш аккаунт подтвержден модераторами')
  end

end
