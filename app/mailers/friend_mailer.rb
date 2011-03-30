class FriendMailer < ActionMailer::Base
  default :from => "notification@launchbox.com"
  
  def invite_email(friend_email, sender_email, sender_link, website_name)
  	@sender_email = sender_email
  	@sender_link  = sender_link
  	@website_name = website_name
    mail(:to => friend_email,
         :subject => "Your friend sent you an invitation to #{@website_name}!")
  end
end
