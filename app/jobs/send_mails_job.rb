class SendMailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user).registration_mail.deliver
  end
end
