class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[gist show update result]

  def show; end

  def result; end

  def gist
    connection = GistQuestionService.new(@test_passage.current_question)
    result = connection.call

    flash_options = if connection.success?
                      current_user.gists.create(question_id: @test_passage.current_question.id, url: result.html_url)
                      { success: t('.success', html_url: result.html_url) }
                    else
                      { danger: t('.danger') }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.complited?
      TestsMailer.complited_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
