class ReviewersController < ApplicationController
  before_action :set_reviewer, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  def index
    @reviewers = Reviewer.all
    respond_with(@reviewers)
  end

  def show
    respond_with(@reviewer)
  end

  def new
    @reviewer = Reviewer.new
    respond_with(@reviewer)
  end

  def edit
    @reviewer = Reviewer.find(params[:id])
  end

  def create
    @reviewer = Reviewer.new(reviewer_params)
    @reviewer.save
    respond_with(@reviewer)
  end

  def update
    @reviewer.update(reviewer_params)
    respond_with(@reviewer)
  end

  def destroy
    @reviewer.destroy
    respond_with(@reviewer)
  end

  private
    def set_reviewer
      @reviewer = Reviewer.find(params[:id])
    end

    def reviewer_params
      params.require(:reviewer).permit(:first_name, :last_name, :email, :title, :division, :bu, :location, :platform, responses_attributes: [:id, :answer_option, :question_id, :reviewer_id, :comment])
    end
end
