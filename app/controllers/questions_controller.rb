class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :js, :json

  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def show
    respond_with(@question)
  end

  def new
    @question = Question.new
    respond_with(@question)
  end

  def edit
    logger.debug "Hello"
    @kpis = Kpi.where(metric_id: @question.metric_id)
    @kpi = Kpi.find(@question.kpi_id)
    
  end

  def create
    @question = Question.new(question_params)
    @question.save
    respond_with(@question)
  end

  def update
    @question.update(question_params)
    respond_with(@question)
  end

  def destroy
    @question.destroy
    respond_with(@question)
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:metric_id, :kpi_id, campaign_attributes: [:id,:tier, :name, :status, :start_date, :end_date], responses_attributes: [:id, :answer_option, :question_id, :reviewer_id, :comment])
    end
end
