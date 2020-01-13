class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    1.times { @customer.user_invites.build }
    #@user = User.new
  end

  # GET /customers/1/edit
  def edit
    #@user = User.new
    unless @customer.user_invites.present?
      1.times { @customer.user_invites.build }
    end
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    @customers = Customer.where.not(id:1)
    respond_to do |format|
      if @customer.save
        _invitees = params[:customer][:user_invites_attributes]
          logger.debug "_invitees is : #{_invitees}"
          _invitees.each do |invite|
              iterID = invite.first
              logger.debug "invite.first is #{invite.first} "        
              email         = params[:customer][:user_invites_attributes]["#{iterID}"][:email]
              first         = params[:customer][:user_invites_attributes]["#{iterID}"][:first]
              last          = params[:customer][:user_invites_attributes]["#{iterID}"][:last]
              role_id       = params[:customer][:user_invites_attributes]["#{iterID}"][:role_id]
              # send email invitation if email address does not exist in the system;
              _user = User.find_by_email(email)
              if _user.nil?
                logger.debug "\n\n SENDING INVITATION MAIL  !!!  \n\n"
                user = User.invite!(:email => email, :first_name => first, :last_name => last )
                user.customer_id = @customer.id # Save Customer ID to User Table.
                user.save
                 # Add USer Roles
                _user_role = UserRole.new
                _user_role.user_id = user.id
                _user_role.role_id = role_id
                _user_role.save
                logger.debug "\n\n SENT INVITATION MAIL  !!!  \n\n"
              else
                logger.debug "\n\n USER ALREADY EXISTS. INVITATION NOT SENT !!!  \n\n"
              end                 
          end
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
        format.js
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
     end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    @customers = Customer.where.not(id:1)
    respond_to do |format|
      if @customer.update(customer_params)
        send_user_invites_on_update(params[:customer][:user_invites_attributes])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def send_user_invites_on_update(uia)
    #1. Send User Invitations on EDIT to the Invites that have the checkboxes checked.
    #logger.debug "\n\n abc['0'][:email] is #{abc['0'][:email]} \n\n"
    _invitees = params[:customer][:user_invites_attributes]    
      #logger.debug "\n\n params[:school][:user_invites_attributes]['0'][:email] is #{params[:school][:user_invites_attributes]['0'][:email]} \n\n"
    if  !_invitees.nil? # This can be nil in the case when no team members are added to school.
      _invitees.each do |invite|
        iterID = invite.first
        logger.debug"\n iterID is #{iterID}\n"        
        email         = uia["#{iterID}"][:email]
        first         = uia["#{iterID}"][:first]
        last          = uia["#{iterID}"][:last]
        _role_id       = uia["#{iterID}"][:role_id]
        
         _user = User.find_by_email(email)
       
        if _user.nil?
          logger.debug "\n\n SENDING INVITATION MAIL  !!!  \n\n"
          user = User.invite!(:email => email, :first_name => first, :last_name => last )
          user.customer_id = @customer.id # Save Customer ID to User Table.
          user.save
           # Add USer Roles
          _user_role = UserRole.new
          _user_role.user_id = user.id
          _user_role.role_id = _role_id
          _user_role.save
          logger.debug "\n\n SENT INVITATION MAIL  !!!  \n\n"
        else
          logger.debug "\n\n USER ALREADY EXISTS. INVITATION NOT SENT !!!  \n\n"
        end
                        
      end   #_invitees.each do |invite| loop end
    end  # if  !_invitees.nil? check end
    
  end
  
  def import
    Customer.import(params[:file])
    redirect_to "/", notice: "Customer imported."
  end
  
  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  ### RESEND INVITE ###
  def resend_invite
    user = User.invite!(:email => params[:email], :first_name => params[:first], :last_name => params[:last])  
  end
  
  def check_email
    @user = User.find_by_email(params[:customer][:user_invites_attributes]["0"][:email])
      respond_to do |format|
       format.json { render :json => !@user }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
      #@user = User.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :address, :city, :state, :zipcode, :poc_first_name, :poc_last_name, :poc_email, :poc_phone, :size, :gross_revenue, vendor_ids: [], ctype_ids: [], user_invites_attributes: [:id, :first, :last, :email, :role_id, :invited, :_destroy])
    end
end
