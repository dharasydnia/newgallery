class DevelopmentMailInterceptor
  def self.delivering_mail(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to      = "dharasydnia@gmail.com"
  end
end
