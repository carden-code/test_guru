class FeedbackMailer < ApplicationMailer
  def send_feedback
    message = params.text.concat("\nFrom #{params.email}")
    
    mail(to: 'yourtestsapp@gmail.com', subject: 'Feedback from TestGuru') do |format|
      format.text { render plain: message }
    end
  end
end
