class UserMailer < ActionMailer::Base
  default :from => "admin@launchbox.com"
  
  def confirmation_email(user, website)
  	@user = user
  	@website = website
  	@website_name = @website.url
  	@confirmation_code = @user.confirmation_code
  	mail(:to => @user.email,
         :subject => "Please confirm your email to complete sign up")
  end
  
  
end
