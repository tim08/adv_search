class NotificationMailer < ApplicationMailer
  def notification_request
    mail(to: 'batman_forever00@mail.ru', subject: 'PromoWind: Новая заявка')
  end
end
