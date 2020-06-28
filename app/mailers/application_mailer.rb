class ApplicationMailer < ActionMailer::Base
  default from: %('TestGuru' <yourtests.herokuapp.com>)
  layout 'mailer'
end
