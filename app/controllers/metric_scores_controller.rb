class MetricScoresController < ApplicationController
  before_action :set_metric_score, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #@metric_scores = MetricScore.all
    @vendors = Vendor.all
    @metric_scores = MetricScore.joins(:metric, :vendor).select("metric_scores.*, metrics.metric_name, vendors.name vendor_name")
    @metric_years = Array.new
    year = Vendor.first.created_at.year
    until year > Time.now.year
      @metric_years.push(year)
      year += 1
    end
    logger.debug "METRIC YEARS --------- #{@metric_years}"
    respond_with(@metric_scores)
  end

  def show
    respond_with(@metric_score)
  end

  def new
    @metric_score = MetricScore.new
    respond_with(@metric_score)
  end

  def edit
  end

  def create
    @metric_score = MetricScore.new(metric_score_params)
    @metric_score.save
    respond_with(@metric_score)
  end

  def update
    @metric_score.update(metric_score_params)
    respond_with(@metric_score)
  end

  def destroy
    @metric_score.destroy
    respond_with(@metric_score)
  end
  
  def pan7_performance
    vendor_id = params[:market_chart_data]
    vendor_year = params[:market_year]
    m_score = MetricScore.new
    data = m_score.pan7_performance_data(vendor_id)
    logger.debug "DATA IS #{data}"
    total_data = m_score.pan7_performance_data_across_industry(vendor_id)
    #data = _cmp.get_performance_review_by_quarter_data(year)
    @chartper = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.title({ text: 'Top Categories', x: -50})
      
      f.plotOptions( 
      pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      
      dataLabels: {
      enabled: true,
      format: '<b>{point.name}</b>: {point.percentage:.1f} %'
      }
      }
      )
      f.legend( { enabled: true })
      f.series( name: 'Number of Responses',
        data: [
              ['Quality', data["Quality"]["percent"]],
              ['Customer Support', data["Customer Support"]["percent"]],
              ['Performance', data["Performance"]["percent"]],
              ['Delivery & Support', data["Delivery & Support"]["percent"]]
            ]
      )
      f.chart(:defaultSeriesType => "pie", :marginRight => 100)
    end
    
    @chartper2 = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.title({ text: 'Top Categories for all Industries of this Vendor', x: -50})
      
      f.plotOptions( 
      pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      
      dataLabels: {
      enabled: true,
      format: '<b>{point.name}</b>: {point.percentage:.1f} %'
      }
      }
      )
      f.legend( { enabled: true })
      f.series( name: 'Number of Responses',
        data: [
              ['Quality', total_data["Quality"]["percent"]],
              ['Customer Support', total_data["Customer Support"]["percent"]],
              ['Performance', total_data["Performance"]["percent"]],
              ['Delivery & Support', total_data["Delivery & Support"]["percent"]]
            ]
      )
      f.chart(:defaultSeriesType => "pie", :marginRight => 100)
    end
    logger.debug "CHARTPERS #{@chartper} AND #{@chartper2}"
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def performance
    vendor_id = params[:market_chart_data]
    vendor_year = params[:market_year]
    m_score = MetricScore.new
    data = m_score.performance_data(vendor_id)
    logger.debug "DATA IS #{data}"
    total_data = m_score.performance_data_across_industry(vendor_id)
    #data = _cmp.get_performance_review_by_quarter_data(year)
    @chartper = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.title({ text: 'Top Categories', x: -50})
      
      f.plotOptions( 
      pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      
      dataLabels: {
      enabled: true,
      format: '<b>{point.name}</b>: {point.percentage:.1f} %'
      }
      }
      )
      f.legend( { enabled: true })
      f.series( name: 'Number of Responses',
        data: [
              ['Quality', data["Quality"]["percent"]],
              ['Customer Support', data["Customer Support"]["percent"]],
              ['Performance', data["Performance"]["percent"]],
              ['Delivery & Support', data["Delivery & Support"]["percent"]]
            ]
      )
      f.chart(:defaultSeriesType => "pie", :marginRight => 100)
    end
    
    @chartper2 = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.title({ text: 'Top Categories for all Industries of this Vendor', x: -50})
      
      f.plotOptions( 
      pie: {
      allowPointSelect: true,
      cursor: 'pointer',
      
      dataLabels: {
      enabled: true,
      format: '<b>{point.name}</b>: {point.percentage:.1f} %'
      }
      }
      )
      f.legend( { enabled: true })
      f.series( name: 'Number of Responses',
        data: [
              ['Quality', total_data["Quality"]["percent"]],
              ['Customer Support', total_data["Customer Support"]["percent"]],
              ['Performance', total_data["Performance"]["percent"]],
              ['Delivery & Support', total_data["Delivery & Support"]["percent"]]
            ]
      )
      f.chart(:defaultSeriesType => "pie", :marginRight => 100)
    end
    logger.debug "CHARTPERS #{@chartper} AND #{@chartper2}"
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_metric_score
      @metric_score = MetricScore.find(params[:id])
    end

    def metric_score_params
      params.require(:metric_score).permit(:metric_id, :campaign_id, :customer_id, :vendor_id, :actual_score, :total_score)
    end
end
