class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
		@user = user
		UserMailer.sign_up_email(@user).deliver_later
	end
end
