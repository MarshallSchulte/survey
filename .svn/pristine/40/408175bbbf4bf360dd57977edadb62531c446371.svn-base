class ReviewerTypesController < ApplicationController
  before_action :set_reviewer_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviewer_types = ReviewerType.all
    respond_with(@reviewer_types)
  end

  def show
    respond_with(@reviewer_type)
  end

  def new
    @reviewer_type = ReviewerType.new
    respond_with(@reviewer_type)
  end

  def edit
  end

  def create
    @reviewer_type = ReviewerType.new(reviewer_type_params)
    @reviewer_type.save
    respond_with(@reviewer_type)
  end

  def update
    @reviewer_type.update(reviewer_type_params)
    respond_with(@reviewer_type)
  end

  def destroy
    @reviewer_type.destroy
    respond_with(@reviewer_type)
  end

  private
    def set_reviewer_type
      @reviewer_type = ReviewerType.find(params[:id])
    end

    def reviewer_type_params
      params.require(:reviewer_type).permit(:name)
    end
end
