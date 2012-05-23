class UserMailer < ActionMailer::Base
  default from: "dharasydnia@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root/public/images/rails.png}")
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Registered")
  end
end
