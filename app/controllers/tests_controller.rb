class TestsController < ApplicationController

  before_action :find_test, only: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    render plain: Test.all.select(:id, :title).inspect
  end

  def show
    render 'show'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'This test is missing'
  end
end
