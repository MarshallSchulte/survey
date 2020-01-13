class MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json, :js

  def index
    @metrics = Metric.all
    respond_with(@metrics)
  end

  def show
    respond_with(@metric)
  end

  def new
    @metric = Metric.new
    respond_with(@metric)
  end

  def edit
  end

  def create
    @metric = Metric.new(metric_params)
    @metric.save
    @kpis = Kpi.where(original_kpi_id: nil)
    respond_with(@metric)
  end

  def update
    @metric.update(metric_params)
    @kpis = Kpi.where(original_kpi_id: nil)
    respond_with(@metric)
  end

  def destroy
    @metric.destroy
    respond_with(@metric)
  end

  private
    def set_metric
      @metric = Metric.find(params[:id])
    end

    def metric_params
      params.require(:metric).permit(:metric_name, :weight)
    end
end
