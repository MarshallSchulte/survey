class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :find_specialists
  before_filter :set_cache_buster, only: [:survey]
  before_filter :set_headers, only: [:results, :send_to_graphs]
  skip_before_filter :verify_authenticity_token, :only => [:results]
  load_and_authorize_resource

  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end

  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    @metric = Metric.new
    @metrics = Metric.all
    2.times { @campaign.questions.build }
    @templates = Campaign.where(template:true)
    
  end
  
  # GET /add_reviewers/1
  def add_reviewers
    @campaign = Campaign.find(params[:id])
    @vendor = Vendor.find(@campaign.vendor_id)
    logger.debug "Campaign Reviewers: #{@campaign.reviewers.blank?}"
    if @campaign.reviewers && @campaign.reviewers.blank?
      1.times { @campaign.reviewers.build }
    end
    respond_to :html, :json, :js
  end
  
  # GET /send_campaign/1
  def confirm
    @campaign = Campaign.find(params[:id])
    @campaign.update(survey_sent: true, status: "In Process")
    @campaigns = Campaign.where(manager_id: current_user.id, template: false)
  end
  
  def send_campaign
    @campaign = Campaign.find(params[:id])
    @campaign.update(survey_sent: true, status: "Submitted For Review")
    @specialist_campaigns = Campaign.where(specialist_id: current_user.id, template: false, ready: true).order(created_at: :desc)
  end
  
  def drafted
    @campaign = Campaign.find(params[:id])
    @campaign.update(survey_sent: true, status: "Draft")
    @campaigns = Campaign.where(manager_id: current_user.id, template: false)
  end
  
  def on_hold
    @campaign = Campaign.find(params[:id])
    @campaign.update(status: "On Hold")
    @campaigns = Campaign.where(manager_id: current_user.id, template: false)
  end
  
      # GET /send_campaign/1
  def send_to_reviewers
    @specialist_campaigns = Campaign.where(specialist_id: current_user.id, template: false, ready: true).order(created_at: :desc)
    @campaign = Campaign.find(params[:id])
    @campaigns = Campaign.where(manager_id: current_user.id, template: false)
    @campaign.reviewers.each do |reviewer|
      #Send Mail with the survey link to each reviewer.
      #_survey_link  = "/survey/?token=#{reviewer.token}"
      #_email        = reviewer.email
      @reviewer = reviewer
      logger.debug "Before Survey Mail"
      SurveyMailer.survey_email(@reviewer).deliver!
      logger.debug "After Survey Mail"
      @campaign.update(status: "In Process")
    end
  end
  
  def resend_survey
    @reviewer = Reviewer.find(params[:id])
    logger.debug "Before Survey Mail #{SurveyMailer.survey_email(@reviewer)}"
      SurveyMailer.survey_email(@reviewer).deliver!
      logger.debug "After Survey Mail"
    @reviewer.update(survey_complete: false)
  end
  
  def save_survey
    @campaign = Campaign.find(params[:id])
    logger.debug "campaign is #{@campaign.name}"
    if @campaign.update(campaign_params)
      logger.debug "-----------------SAVE COMPLETE--------------------"
       @reviewer = Reviewer.find(@campaign.responses.last.reviewer_id)
       @reviewer.update(survey_complete: false)
       redirect_to root_path
    end
  end
  
  
  # GET /campaigns/1
  def survey
    @reviewer = Reviewer.find_by_token(params[:token])
    logger.debug "@reviewer is : #{params[:token]}"
    #campaign_id = CampaignsReviewer.find_by_reviewer_id(@reviewer.id).campaign_id
    cmp = Campaign.find_by_sql("SELECT campaigns.id, campaigns_reviewers.reviewer_id FROM campaigns, campaigns_reviewers
                                   WHERE campaigns.id = campaigns_reviewers.campaign_id AND campaigns_reviewers.reviewer_id = #{@reviewer.id}")
    logger.debug "cmp.inspect is : #{cmp[0].id}"
    @campaign = Campaign.find(cmp[0].id)
=begin
    incomplete = 0
    @campaign.questions.each do |q| 

      if (q.responses.where(reviewer_id: @reviewer.id).blank?) || (q.responses.where(reviewer_id: @reviewer.id, answer_option: nil).present?)   
          incomplete += 1
      end
    end
    
    if incomplete > 0
      logger.debug "----incomplete:#{incomplete}------------"
      @reviewer.update(survey_complete: false)
      
    else
      @reviewer.update(survey_complete: true)
    end
=end
    logger.debug "@campaign is : #{@campaign.inspect}"
  end

  # GET /campaigns/1/edit
  def edit
    @metrics = Metric.all
    @questions = @campaign.questions
    @templates = Campaign.where(template:true)
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    @campaigns = Campaign.where(manager_id: current_user.id, template: false).order(created_at: :desc)
    @campaign.manager_id = current_user.id
    @campaign.status = "Draft"
    @campaign.survey_sent = false
    @templates = Campaign.where(template:true)
    @campaign.customer_id = current_user.customer_id
    @campaign.ready = false
    @vendor_array = []
      Vendor.all.each do |v|
        if v.customers.where(id: @campaign.customer_id).present?
          @vendor_array.push(v)
        end
      end
      @specialist_array = []
      User.where(customer_id: current_user.customer_id).each do |u|
        logger.debug "---------------------USER ROLE: #{u.roles.first}----------------------------"
        if u.roles.first.id == 3
          @specialist_array.push(u)
        end
      end
    
    if current_user.roles.first.id == 1
      @campaign.template = true
    else
      @campaign.template = false
    end
    respond_to do |format|
      if @campaign.save
        # #logger.debug "@campaign.questions is #{@campaign.questions.to_a}"
        # #logger.debug "params[:campaign][:questions_attributes] is #{params[:campaign][:questions_attributes]}"
        # @campaign.questions.each do |question, index|
            # #logger.debug "question #{index}, QID is #{question.id}"
            # params[:campaign][:questions_attributes].each do |k, v|
              # #v['contact_ids'] = [ v['contact_ids'] ] unless v['contact_ids'].is_a?(Array)
              # #logger.debug "k is: #{k} AND v is: #{v} AND reviewer_types are: #{v[:id]}"
              # #logger.debug "@campaign.questions[#{k}] is #{@campaign.questions[k.to_i].inspect}"
              # if v[:id].include? "1"; @campaign.questions[k.to_i].rt_supplier = true; end;
              # if v[:id].include? "2"; @campaign.questions[k.to_i].rt_business_unit = true; end;
              # if v[:id].include? "3"; @campaign.questions[k.to_i].rt_strategic_sourcing = true; end;
              # if v[:id].include? "4"; @campaign.questions[k.to_i].rt_supplier_diversity = true; end;
              # if v[:id].include? "5"; @campaign.questions[k.to_i].rt_governance = true; end;
              # if v[:id].include? "6"; @campaign.questions[k.to_i].srm = true; end;
            # end
        # end
         # logger.debug "@campaign.questions.to_a is #{@campaign.questions.to_a}"
         # @campaign.save # After the Supplier types assignments are made.
        format.html { redirect_to root_path, notice: 'Campaign was successfully created.' }
        format.json { render root_path, status: :created, location: @campaign }
        format.js
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    if current_user
      @campaigns = Campaign.where(manager_id: current_user.id, template: false).order(created_at: :desc)
      @specialist_campaigns = Campaign.where(specialist_id: current_user.id, template: false, ready: true).order(created_at: :desc)
      @templates = Campaign.where(template:true)
      @customer = Customer.find(current_user.customer_id) if !current_user.customer_id.blank?
      @current_user_role = current_user.roles.first.id
      @vendor_array = []
          Vendor.all.order('tier DESC, cw DESC').each do |v|
            if v.customers.where(id: @customer.id).present?
              @vendor_array.push(v)
            end
          end
      @specialist_array = []
      User.where(customer_id: @customer.id).each do |u|
        logger.debug "---------------------USER ROLE: #{u.roles.first}----------------------------"
        if u.roles.first.id == 3
          @specialist_array.push(u)
        end
      end
      @id_array = []
    @cw_total = 0
    @cw_average = 0
    @this_specialist = []
    @this_vendor = []
    @vendor_array.each do |v|
      @id_array.push(v.id)
    end
    Campaign.where(customer_id: current_user.customer_id, vendor_id: @id_array, end_date: "#{Time.now.year}0101".."#{Time.now.year}1231").each do |c|
     any_vendors = 0
     @this_vendor.each do |v|
       if v == c.vendor_id
         any_vendors += 1
       end
     end
     unless any_vendors > 0
       @this_vendor << c.vendor_id
     end
     if Vendor.find(c.vendor_id).cw
      @cw_total += Vendor.find(c.vendor_id).cw
      any = 0
      @this_specialist.each do |sp|
        if sp.id == c.specialist_id
          any += 1
        end
      end
      unless any > 0
       if c.specialist_id.present?
        @this_specialist << User.find(c.specialist_id)
       end
      end
     end
    end
    if @this_specialist.present?
      @cw_average = @cw_total/(@this_specialist.count)
      @this_vendor_per_specialist = (@this_vendor.count)/(@this_specialist.count)
    else
      @cw_average = "N/A"
      @this_vendor_per_specialist = "N/A"
    end 
    @this_year_campaigns = Campaign.where(customer_id: current_user.customer_id, vendor_id: @id_array, end_date: "#{Time.now.year}0101".."#{Time.now.year}1231").count
    #finding for last year
    @cw_last_total = 0
    @last_vendor = []
    @last_specialist = []
    Campaign.where(customer_id: current_user.customer_id, vendor_id: @id_array, end_date: "#{Time.now.year - 1}0101".."#{Time.now.year - 1}1231").each do |c|
     any_vendors = 0
     @last_vendor.each do |v|
       if v == c.vendor_id
         any_vendors += 1
       end
     end
     unless any_vendors > 0
       @last_vendor << c.vendor_id
     end
     if Vendor.find(c.vendor_id).cw
      @cw_last_total += Vendor.find(c.vendor_id).cw
      any = 0
      @last_specialist.each do |sp|
        if sp.id == c.specialist_id
          any += 1
        end
      end
      unless any > 0
       if c.specialist.present?
        @last_specialist << User.find(c.specialist_id)
       end
      end
     end
    end
    if @last_specialist.present?
      @cw_last_average = @cw_last_total/(@last_specialist.count)
      @last_vendor_per_specialist = (@last_vendor.count)/(@last_specialist.count)
    else
      @cw_last_average = "N/A"
      @last_vendor_per_specialist = "N/A"
    end
    @last_year_campaigns = Campaign.where(customer_id: current_user.customer_id, vendor_id: @id_array, end_date: "#{Time.now.year - 1}0101".."#{Time.now.year - 1}1231").count
    end
    if @current_user_role == 3
      @campaign.template = false
      @campaign.questions.destroy_all
    end
      
    respond_to do |format|
      #binding.pry
      if @campaign.update(campaign_params)
       logger.debug "-----------------UPDATE COMPLETE--------------------"
       if @current_user_role == 3
          @template = Campaign.find(@campaign.template_id)
          @template.questions.each do |q|
            dupe = q.dup
            kpid = q.kpi_id
            orig_kpi = Kpi.find(kpid)
            kpi_dupe = orig_kpi.dup
            kpi_dupe.original_kpi_id = kpid
            kpi_dupe.save
            dupe.kpi_id = kpi_dupe.id
            @campaign.questions << dupe
          end
       end
       unless current_user
        incomplete = 0
        @reviewer = Reviewer.find(@campaign.responses.last.reviewer_id)
        if params[:commit] == "Submit"
              @reviewer.update(survey_complete: true)
              if @campaign.reviewers.where(survey_complete: false).blank?
                @campaign.update(rr: true)
              end
        elsif params[:commit] == "Save"
          @reviewer.update(survey_complete: false)
        end
       end
       
        # @campaign.questions.each do |question, index|
            # logger.debug "question #{index}, QID is #{question.id}"
            # params[:campaign][:questions_attributes].each do |k, v|
              # logger.debug "k is: #{k} AND v is: #{v} AND reviewer_types are: #{v[:id]}"
              # logger.debug "@campaign.questions[#{k}] is #{@campaign.questions[k.to_i].inspect}"
              # if v[:id].include? "1"; @campaign.questions[k.to_i].rt_supplier = true; end;
              # if v[:id].include? "2"; @campaign.questions[k.to_i].rt_business_unit = true; end;
              # if v[:id].include? "3"; @campaign.questions[k.to_i].rt_strategic_sourcing = true; end;
              # if v[:id].include? "4"; @campaign.questions[k.to_i].rt_supplier_diversity = true; end;
              # if v[:id].include? "5"; @campaign.questions[k.to_i].rt_governance = true; end;
              # if v[:id].include? "6"; @campaign.questions[k.to_i].srm = true; end;
            # end
        # end
        # logger.debug "@campaign.questions.to_a is #{@campaign.questions.to_a}"
         # @campaign.save # After the Supplier types assignments are made.
        #format.html { redirect_to "/add_reviewers/#{params[:id]}", notice: 'Campaign was successfully updated.' }
        format.html { redirect_to root_path, notice: 'Campaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @campaign }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def results
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    year = Time.new.year
    chart_4_data = @campaign.get_performance_review_by_quarter_data(year)
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      @answer_array = answer_array
    end
    @chart1 = LazyHighCharts::HighChart.new("graph") do |g|
      g.title(text: "Average Score By Metric")
      g.xAxis(title: {text: "Metrics"}, categories: metric_names)
      g.series(name: "Average Score", yAxis: 0, data: answer_array)
      
      g.yAxis [
        {title: {text: "Average Score", margin: 70} }
      ]
    
      g.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical',)
      g.chart({defaultSeriesType: "column"})
    end
    @chart2 = LazyHighCharts::HighChart.new("graph") do |g|
      g.title(:text => "Polar Metric")
      g.xAxis(:categories => metric_names)
      g.series(:name => "Average Score", :yAxis => 0, :data => answer_array)
      
      g.yAxis [
        {:title => {:text => "Average Score", :margin => 70}, :min => 0 }
      ]
    
      g.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      g.chart({:polar => true, :type => "line"})
    end
    @chart3data1 = [ chart_4_data["Draft"][0], chart_4_data["Draft"][1], chart_4_data["Draft"][2], chart_4_data["Draft"][3] ]
    @chart3data2 = [ chart_4_data["InProcess"][0], chart_4_data["InProcess"][1], chart_4_data["InProcess"][2], chart_4_data["InProcess"][3] ]
    @chart3data3 = [chart_4_data["Complete"][0], chart_4_data["Complete"][1], chart_4_data["Complete"][2], chart_4_data["Complete"][3]]
    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
                  f.title(:text => "Performance Review [Status] by Quarter for <b>#{year}<b>")
                  f.xAxis(:categories => ["Quarter 1", "Quarter 2", "Quarter 3", "Quarter 4"])
                  f.series(:name => "Draft", :yAxis => 0, :data => @chart3data1)
                  f.series(:name => "In Process", :yAxis => 0, :data => @chart3data2)
                  f.series(:name => "Completed", :yAxis => 0, :data => @chart3data3)
                  f.yAxis [ {:title => {:text => "Number of Campaigns"}}]
                  f.plot_options( :series=> {:stacking => 'normal'}) if @stacked
                  f.legend(:align => 'right', :verticalAlign => 'top ', :y => 120, :x => -20, :layout => 'vertical',)
                  f.chart({:defaultSeriesType=>"column"})
     end
            
      # SECTION BEGIN CHART 5 Funnel Chart. Sameer (05042015)
      data = @campaign.get_survey_response_rate_by_specialist(year)
      specialists = Campaign.find_by_sql("SELECT count(1) AS total, status, specialist_id,  updated_at FROM campaigns  WHERE updated_at >= '#{year}-01-01' AND updated_at <= '#{year}-12-31' AND template IS NOT TRUE GROUP BY specialist_id, status ORDER BY specialist_id")
      logger.debug "specialists is :::: #{specialists.inspect}"
      specialist_arr = Array.new
      series_draft = Array.new
      series_inprocess = Array.new
      series_completed = Array.new
      specialists.each_with_index do |sp, index|
        logger.debug "sp[#{index}] ::: is ::: #{sp.inspect}"
        specialist_arr = specialist_arr.push(User.find(sp.specialist_id).name)
      end
      specialist_arr = specialist_arr.uniq
      # Balancing the data hash
      specialist_arr.each do |spec|
        data["Complete"]  = data["Complete"].merge({spec => 0}) if !data["Complete"].has_key?spec
        data["Draft"]     = data["Draft"].merge({spec => 0}) if !data["Draft"].has_key?spec
        data["InProcess"] = data["InProcess"].merge({spec => 0}) if !data["InProcess"].has_key?spec
        
        data["Complete"].each do |complete|
          #logger.debug "complete is #{complete} "
          series_completed = series_completed.push(complete[1]) if complete[0] == spec
        end
        logger.debug "series_completed is #{series_completed}"
        
        data["Draft"].each do |draft|
          #logger.debug "draft is #{draft} "
          series_draft = series_draft.push(draft[1]) if draft[0] == spec
        end
        @series_draft = series_draft
        logger.debug "series_draft is #{series_draft}"
        
        data["InProcess"].each do |inprocess|
          #logger.debug "inprocess is #{inprocess} "
          series_inprocess = series_inprocess.push(inprocess[1]) if inprocess[0] == spec
        end
        logger.debug "series_inprocess is #{series_inprocess}"
        
      end
      logger.debug "-->>> specialist_arr is : #{specialist_arr}"
      logger.debug "-->>> data after balancing is : #{data}"
      @chart5 = LazyHighCharts::HighChart.new('graph') do |f|
            f.title(:text => "Performance Review [Status] by Specialist for <b>#{year}</b>")
            f.xAxis(:categories => specialist_arr)
            f.series(:name => "Draft", :yAxis => 0, :data => series_draft )
            #f.series(:name => "In Process", :yAxis => 0, :data => series_inprocess )
            #f.series(:name => "Completed", :yAxis => 0, :data => series_completed )
            f.yAxis [ {:title => {:text => "Number of Campaigns"}}]
            f.plot_options( :series=> {:stacking => 'normal'}) if @stacked
            f.legend(:align => 'right', :verticalAlign => 'top ', :y => 120, :x => -20, :layout => 'vertical',)
            f.chart({:defaultSeriesType=>"funnel", :inverted => true})
      end
      vendor_id = @campaign.vendor.id
      vendor_year = @campaign.created_at.year
      m_score = MetricScore.new
      data = m_score.performance_data(vendor_id)
      logger.debug "DATA IS #{data}"
      total_data = m_score.performance_data_across_industry(vendor_id)
      @chartper3 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
      @chartper4 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
      @chartper5 = LazyHighCharts::HighChart.new('graph') do |f|
      
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
    @chartper6 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
      @chartper7 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
      # SECTION END CHART 5.
  end
  
  def survey_progress
    respond_to :js, :json
  end
  
  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    if current_user.roles.first.id == 1
      @campaigns = Campaign.where(template: true)
    elsif current_user.roles.first.id == 2
      @campaigns = Campaign.where(manager_id: current_user.id, template: false)
    elsif current_user.roles.first.id == 3
      @campaigns = Campaign.where(specialist_id: current_user.id, template: false)
    end
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Campaign was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end
  
  def import_campaign
    logger.debug "import_campaign is now called..."
  end
  
  def import
    Campaign.import(params[:file])
    redirect_to "/", notice: "Campaign imported."
  end
  
  def send_to_graphs
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      @answer_array = answer_array
    end
    @chart1 = LazyHighCharts::HighChart.new("graph") do |g|
      g.title(text: "Average Score By Metric")
      g.xAxis(title: {text: "Metrics"}, categories: metric_names)
      g.series(name: "Average Score", yAxis: 0, data: answer_array)
      
      g.yAxis [
        {title: {text: "Average Score", margin: 70} }
      ]
    
      g.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical',)
      g.chart({defaultSeriesType: "column"})
    end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_graphs_2
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      @answer_array = answer_array
    end
    @chart2 = LazyHighCharts::HighChart.new("graph") do |g|
      g.title(:text => "Polar Metric")
      g.xAxis(:categories => metric_names)
      g.series(:name => "Average Score", :yAxis => 0, :data => answer_array)
      
      g.yAxis [
        {:title => {:text => "Average Score", :margin => 70}, :min => 0 }
      ]
    
      g.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      g.chart({:polar => true, :type => "line"})
    end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_graphs_3
    year = Time.new.year
    chart_4_data = @campaign.get_performance_review_by_quarter_data(year)
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end  
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      @answer_array = answer_array
    end
    @chart3data1 = [ chart_4_data["Draft"][0], chart_4_data["Draft"][1], chart_4_data["Draft"][2], chart_4_data["Draft"][3] ]
    @chart3data2 = [ chart_4_data["InProcess"][0], chart_4_data["InProcess"][1], chart_4_data["InProcess"][2], chart_4_data["InProcess"][3] ]
    @chart3data3 = [chart_4_data["Complete"][0], chart_4_data["Complete"][1], chart_4_data["Complete"][2], chart_4_data["Complete"][3]]
    @chart3 = LazyHighCharts::HighChart.new('graph') do |f|
                  f.title(:text => "Performance Review [Status] by Quarter for <b>#{year}<b>")
                  f.xAxis(:categories => ["Quarter 1", "Quarter 2", "Quarter 3", "Quarter 4"])
                  f.series(:name => "Draft", :yAxis => 0, :data => @chart3data1)
                  f.series(:name => "In Process", :yAxis => 0, :data => @chart3data2)
                  f.series(:name => "Completed", :yAxis => 0, :data => @chart3data3)
                  f.yAxis [ {:title => {:text => "Number of Campaigns"}}]
                  f.plot_options( :series=> {:stacking => 'normal'}) if @stacked
                  f.legend(:align => 'right', :verticalAlign => 'top ', :y => 120, :x => -20, :layout => 'vertical',)
                  f.chart({:defaultSeriesType=>"column"})
     end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_graphs_5
      year = 2015
      @underscore_name = current_user.name.gsub( /\W/, '-' )
      @time = Time.now.strftime("%I%M%S%z")
      @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
      data = @campaign.get_survey_response_rate_by_specialist(year)
      specialists = Campaign.find_by_sql("SELECT count(1) AS total, status, specialist_id,  updated_at FROM campaigns  WHERE updated_at >= '#{year}-01-01' AND updated_at <= '#{year}-12-31' AND template IS NOT TRUE GROUP BY specialist_id, status ORDER BY specialist_id")
      logger.debug "specialists is :::: #{specialists.inspect}"
      specialist_arr = Array.new
      series_draft = Array.new
      series_inprocess = Array.new
      series_completed = Array.new
      specialists.each_with_index do |sp, index|
        logger.debug "sp[#{index}] ::: is ::: #{sp.inspect}"
        specialist_arr = specialist_arr.push(User.find(sp.specialist_id).first_name + " " + User.find(sp.specialist_id).last_name)
      end
      specialist_arr = specialist_arr.uniq
      # Balancing the data hash
      specialist_arr.each do |spec|
        data["Complete"]  = data["Complete"].merge({spec => 0}) if !data["Complete"].has_key?spec
        data["Draft"]     = data["Draft"].merge({spec => 0}) if !data["Draft"].has_key?spec
        data["InProcess"] = data["InProcess"].merge({spec => 0}) if !data["InProcess"].has_key?spec
        
        data["Complete"].each do |complete|
          #logger.debug "complete is #{complete} "
          series_completed = series_completed.push(complete[1]) if complete[0] == spec
        end
        logger.debug "series_completed is #{series_completed}"
        
        data["Draft"].each do |draft|
          #logger.debug "draft is #{draft} "
          series_draft = series_draft.push(draft[1]) if draft[0] == spec
        end
        logger.debug "series_draft is #{series_draft}"
        
        data["InProcess"].each do |inprocess|
          #logger.debug "inprocess is #{inprocess} "
          series_inprocess = series_inprocess.push(inprocess[1]) if inprocess[0] == spec
        end
        logger.debug "series_inprocess is #{series_inprocess}"
        
      end
      @series_draft = series_draft
      logger.debug "-->>> specialist_arr is : #{specialist_arr}"
      logger.debug "-->>> data after balancing is : #{data}"
      @chart5 = LazyHighCharts::HighChart.new('graph') do |f|
            f.title(:text => "Performance Review [Status] by Specialist for <b>#{year}</b>")
            f.xAxis(:categories => specialist_arr)
            f.series(:name => "Draft", :yAxis => 0, :data => @series_draft )
            #f.series(:name => "In Process", :yAxis => 0, :data => series_inprocess )
            #f.series(:name => "Completed", :yAxis => 0, :data => series_completed )
            f.yAxis [ {:title => {:text => "Number of Campaigns"}}]
            f.plot_options( :series=> {:stacking => 'normal'}) if @stacked
            f.legend(:align => 'right', :verticalAlign => 'top ', :y => 120, :x => -20, :layout => 'vertical',)
            f.chart({:defaultSeriesType=>"funnel", :inverted => true})
      end  
      @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
      @graph = Graph.new
      @graph.campaign_id = @campaign.id
      @graph.user_id = current_user.id
      @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
      @underscore_name = current_user.name.gsub( /\W/, '-' )
      @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
      @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
      @graph.save
      
      respond_to :json, :js
   end
   
   def send_to_ma_graphs
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
    end
    vendor_id = @campaign.vendor.id
    vendor_year = @campaign.created_at.year
      m_score = MetricScore.new
      @data = m_score.performance_data(vendor_id)
      logger.debug "DATA IS #{@data}"
      total_data = m_score.performance_data_across_industry(vendor_id)
      @answer_array = [
                ['Quality', @data["Quality"]["percent"]],
                ['Customer Support', @data["Customer Support"]["percent"]],
                ['Performance', @data["Performance"]["percent"]],
                ['Delivery & Support', @data["Delivery & Support"]["percent"]]
              ]
      @q = ['Quality', @data["Quality"]["percent"]]
      @cs = ['Customer Support', @data["Customer Support"]["percent"]]
      @p = ['Performance', @data["Performance"]["percent"]]
      @ds = ['Delivery & Support', @data["Delivery & Support"]["percent"]]
      logger.debug "ANSWER ARRAY ------ #{@answer_array}"
   @chartper3 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
          data: @answer_array
        )
        f.chart(:defaultSeriesType => "pie", :marginRight => 100)
      end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_ma_graphs_2
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      
    end
    vendor_id = @campaign.vendor.id
    vendor_year = @campaign.created_at.year
      m_score = MetricScore.new
      data = m_score.performance_data(vendor_id)
      logger.debug "DATA IS #{data}"
      total_data = m_score.performance_data_across_industry(vendor_id)
      @data = total_data
      @answer_array2 = [
                ['Quality', total_data["Quality"]["percent"]],
                ['Customer Support', total_data["Customer Support"]["percent"]],
                ['Performance', total_data["Performance"]["percent"]],
                ['Delivery & Support', total_data["Delivery & Support"]["percent"]]
              ]
   @chartper4 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
          data: @answer_array2
        )
        f.chart(:defaultSeriesType => "pie", :marginRight => 100)
      end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_ma_graphs_3
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      
    end
    vendor_id = @campaign.vendor.id
    vendor_year = @campaign.created_at.year
      m_score = MetricScore.new
      data = m_score.performance_data(vendor_id)
      logger.debug "DATA IS #{data}"
      total_data = m_score.performance_data_across_industry(vendor_id)
      @data = total_data
      @answer_array2 = [
                ['Quality', @data["Quality"]["percent"]],
                ['Customer Support', @data["Customer Support"]["percent"]],
                ['Performance', @data["Performance"]["percent"]],
                ['Delivery & Support', @data["Delivery & Support"]["percent"]]
              ]
   @chartper5 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
          data: @answer_array2
        )
        f.chart(:defaultSeriesType => "pie", :marginRight => 100)
      end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_ma_graphs_4
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      
    end
    vendor_id = @campaign.vendor.id
    vendor_year = @campaign.created_at.year
      m_score = MetricScore.new
      data = m_score.performance_data(vendor_id)
      logger.debug "DATA IS #{data}"
      total_data = m_score.performance_data_across_industry(vendor_id)
      @data = total_data
      @answer_array2 = [
                ['Quality', @data["Quality"]["percent"]],
                ['Customer Support', @data["Customer Support"]["percent"]],
                ['Performance', @data["Performance"]["percent"]],
                ['Delivery & Support', @data["Delivery & Support"]["percent"]]
              ]
   @chartper6 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
          data: @answer_array2
        )
        f.chart(:defaultSeriesType => "pie", :marginRight => 100)
      end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
   
   def send_to_ma_graphs_5
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @time = Time.now.strftime("%I%M%S%z")
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    metric_array = @campaign.metric_average
    answer_array = []
    metric_names = []
    metric_array.each do |m|
      metric_average = 0
      @campaign.questions.where(metric_id: m).each do |q|
        logger.debug "average: ------------------#{q.average}--------------------"
        if q.average
          metric_average += q.average
        end
        
      end
      metric_names.push(Metric.find(m).metric_name)
      answer_array.push(metric_average)
      
    end
    vendor_id = @campaign.vendor.id
    vendor_year = @campaign.created_at.year
      m_score = MetricScore.new
      data = m_score.performance_data(vendor_id)
      
      logger.debug "DATA IS #{data}"
      total_data = m_score.performance_data_across_industry(vendor_id)
      @data = total_data
      @answer_array2 = [
                ['Quality', @data["Quality"]["percent"]],
                ['Customer Support', @data["Customer Support"]["percent"]],
                ['Performance', @data["Performance"]["percent"]],
                ['Delivery & Support', @data["Delivery & Support"]["percent"]]
              ]
   @chartper7 = LazyHighCharts::HighChart.new('graph') do |f|
        
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
          data: @answer_array2
        )
        f.chart(:defaultSeriesType => "pie", :marginRight => 100)
      end
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count + 1
    @graph = Graph.new
    @graph.campaign_id = @campaign.id
    @graph.user_id = current_user.id
    @graph.slide_number = Graph.where(campaign_id: @graph.campaign_id, user_id: current_user.id).count + 1
    @underscore_name = current_user.name.gsub( /\W/, '-' )
    @graph.filename = 'app/assets/images/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.rails_path = 'assets/chart_' + "#{@underscore_name}_#{@graph_count}_#{@time}" + '.jpg'
    @graph.save
    respond_to :json, :js
   end
  
  def remove_from_graphs
    @graph = Graph.find(params[:id])
    logger.debug "DELETE IT: #{File.delete(@graph.filename)}"
    File.delete(@graph.filename)
    @graph.destroy
  end
  
  def powerpoint
    @graph_count = Graph.where(campaign_id: @campaign.id, user_id: current_user.id).count
    @graphs = Graph.where(campaign_id: @campaign.id, user_id: current_user.id)
    @powerpoint = Powerpoint::Presentation.new
    @graphs.each do |g|
      title = "example"
      image = g.filename
      @powerpoint.add_pictorial_slide title, image
    end
    unless File.directory?("public/#{current_user.name}")
      Dir.mkdir("public/#{current_user.name}")
    end
    @powerpoint.save("public/#{current_user.name}/#{@campaign.name}.pptx")
    logger.debug "Before Survey Mail #{SurveyMailer.powerpoint_email(current_user, @campaign)}"
    SurveyMailer.powerpoint_email(current_user, @campaign).deliver!
    @graphs.each do |g|
      File.delete(g.filename)
    end
    @graphs.destroy_all
    respond_to :json, :js
  end
  
  def remove_all
    @graphs = Graph.where(campaign_id: @campaign.id, user_id: current_user.id)
    @graphs.each do |g|
      File.delete(g.filename)
    end
    @graphs.destroy_all
    Rails.cache.clear
  end
  
  def export_spreadsheet
    @questions = @campaign.questions
    respond_to do |format| 
       format.xlsx {render xlsx: 'export_spreadsheet',filename: "#{@campaign.name}_results.xlsx"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
      # @user_roles = UserRole.where(role_id: 2)
      #@specialists = User.joins(:user_roles)
    end
    
    def find_specialists
      @specialists = User.find_by_sql("
      SELECT users.id, users.first_name, users.last_name,  
      user_roles.role_id, user_roles.user_id 
      FROM users, user_roles
      WHERE user_roles.role_id = 3 
      AND users.id = user_roles.user_id
      ")
    end
    
    def set_cache_buster
        response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
    
    def set_headers
      response.headers["Access-Control-Allow-Origin"] = "*"
      response.headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      response.headers['Access-Control-Request-Method'] = '*'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.require(:campaign).permit(:tier, :name, :status, :start_date, :end_date, :user_id, :vendor_id, :customer_id, :specialist_id, :manager_id, :survey_sent, :template, :ready, :template_id, :executive_sponsor, reviewer_ids: [], question_ids: [], questions_attributes: [:id, :metric_id, :kpi_id, :rt_supplier, :rt_business_unit, :rt_strategic_sourcing, :rt_supplier_diversity, :rt_governance, :srm, :weight, :opt1, :opt2, :opt3, :opt4, :opt5, :opt6, :opt7, '_destroy', responses_attributes: [:id, :answer_option, :question_id, :reviewer_id, :comment]], reviewers_attributes: [:id, :first_name, :last_name, :email, :reviewer_type_id, :survey_sent, :title, :division, :bu, :location, :platform, :_destroy])
    end
end
