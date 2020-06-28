class ApplicationMailer < ActionMailer::Base
  default from: %('TestGuru' <yourtests.heroku.com>)
  layout 'mailer'
end
