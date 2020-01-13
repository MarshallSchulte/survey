class UserInvitesController < ApplicationController
  before_action :set_user_invite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_invites = UserInvite.all
    respond_with(@user_invites)
  end

  def show
    respond_with(@user_invite)
  end

  def new
    @user_invite = UserInvite.new
    respond_with(@user_invite)
  end

  def edit
  end

  def create
    @user_invite = UserInvite.new(user_invite_params)
    if @user_invite.save
    _invitees = @user_invite
              user = User.new
              if user.admin(current_user.id)
                @user_invite.update(role_id: 2)
              elsif user.campaign_manager(current_user.id)
                @user_invite.update(role_id: 3, customer_id: current_user.customer_id)
              end    
              email         = @user_invite.email
              first         = @user_invite.first
              last          = @user_invite.last
              role_id       = @user_invite.role_id
              # send email invitation if email address does not exist in the system;
              
              _user = User.find_by_email(email)
              if _user.nil?
                logger.debug "\n\n SENDING INVITATION MAIL  !!!  \n\n"
                user = User.invite!(:email => email, :first_name => first, :last_name => last, :customer_id => @user_invite.customer_id, :senior_specialist => false)
                user.save
                 # Add USer Roles
                _user_role = UserRole.new
                _user_role.user_id = user.id
                _user_role.role_id = role_id
                logger.debug "ROLE_ID #{role_id}"
                _user_role.save
                logger.debug "\n\n SENT INVITATION MAIL  !!!  \n\n"
              else
                logger.debug "\n\n USER ALREADY EXISTS. INVITATION NOT SENT !!!  \n\n"
              end
       end
    @customer = Customer.find(current_user.customer_id) if !current_user.customer_id.blank?
    @specialists_for_this_customer = User.find_by_sql("
      SELECT users.id, users.first_name, users.last_name, users.email,  users.senior_specialist,
      user_roles.role_id, user_roles.user_id 
      FROM users, user_roles
      WHERE user_roles.role_id = 3 
      AND users.id = user_roles.user_id AND users.customer_id = #{@customer.id}") if !@customer.blank?              
    respond_to :html, :js
  end
  
  def check_email
    @user = User.find_by_email(params[:email])
    respond_to do |format|
     format.json { render :json => !@user }
    end
  end

  def update
    @user_invite.update(user_invite_params)
    respond_with(@user_invite)
  end

  def destroy
    @user_invite.destroy
    respond_with(@user_invite)
  end

  private
    def set_user_invite
      @user_invite = UserInvite.find(params[:id])
    end

    def user_invite_params
      params.require(:user_invite).permit(:first, :last, :email,  :invited, :customer_id)
    end
end
