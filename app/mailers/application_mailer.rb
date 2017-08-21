class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  default "Message-ID" => "#{Digest::SHA2.hexdigest(Time.now.to_i.to_s)}@#{Rails.application.secrets[:host]}"
  layout 'mailer'
end
