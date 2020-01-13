
  class KpisController < ApplicationController
    before_action :set_kpi, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource
    respond_to :html, :json, :js
  
    def index
      @kpis = Kpi.where(:metric_id => params[:metric_id])
      respond_with(@kpis)
    end
  
    def show
      respond_with(@kpi)
    end
  
    def new
      @kpi = Kpi.new
      @metrics = Metric.all
      respond_with(@kpi)
      
    end
  
    def edit
      @metrics = Metric.all
    end
  
    def create
      @kpi = Kpi.new(kpi_params)
      @kpis = Kpi.where(original_kpi_id: nil)
      @kpi.metric_id = params[:metric_id] if !params[:metric_id].blank?
      if @kpi.save
        respond_with(@kpi)
      end
    end
  
    def update
      @kpi.update(kpi_params)
      @kpis = Kpi.where(original_kpi_id: nil)
      respond_with(@kpi)
    end
  
    def destroy
      @kpi.destroy
      respond_with(@kpi)
    end
  
    private
      def set_kpi
        @kpi = Kpi.find(params[:id])
      end
  
      def kpi_params
        params.require(:kpi).permit(:metric_id, :kpi, :kpi_measurement)
      end
  end
