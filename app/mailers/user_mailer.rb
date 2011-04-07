class UserMailer < ActionMailer::Base
  default :from => "admin@gethypebox.com"
  
  def confirmation_email(user, website)
  	@user = user
  	@website = website
  	@website_name = @website.domain_name
  	@confirmation_code = @user.confirmation_code
  	mail(:to => @user.email,
         :subject => "Please confirm your email to complete sign up")
  end
  
  
end
