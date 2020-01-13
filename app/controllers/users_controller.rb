class UsersController < RegistrationsController
  
  respond_to :html, :json, :js
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])

  end
  
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(account_update_params)
        format.html
        format.json { respond_with_bip(@user)}
      end
    end
  end
  
  def check_email
    @user = User.find_by_email(params[:user_invite][:email])
      respond_to do |format|
       format.json { render :json => !@user }
      end
  end
  
  def deactivate
    @users = User.where(inactive: false)
    @user = User.find(params[:id])
    @user.update(inactive: true)
    respond_to :js, :json
  end
  
  def active_for_authentication?
    super && !inactive
  end
  
  def destroy
    @user = User.find(params[:id])
    @users = User.all
    respond_to do |format|
      if @user.destroy
        format.js
      end
    end
  end
end