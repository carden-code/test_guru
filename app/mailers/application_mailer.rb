class ApplicationMailer < ActionMailer::Base
  default from: %('TestGuru' <yourtestsapp@gmail.com>)
  layout 'mailer'
end
