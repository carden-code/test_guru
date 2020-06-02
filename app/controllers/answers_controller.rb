class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end
end
