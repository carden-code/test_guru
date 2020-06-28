class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.with(@feedback).send_feedback.deliver_now
      #'Feedback was successfully sended.'
      redirect_to root_path, success: t('.feedback_ok')
    else
      #'Failed to send feedback'
      render :new, danger: t('.feedback_no')
    end
  end

  def feedback_params
    params.require(:feedback).permit(:email, :text)
  end
end
