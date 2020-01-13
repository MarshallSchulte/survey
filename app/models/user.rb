class User < ActiveRecord::Base
  belongs_to :customer
   #ROLES = %w[admin campaign_manager specialist customers reviewers]
  has_many :campaigns
  has_many :graphs
  #has_and_belongs_to_many :roles
  has_and_belongs_to_many :roles, join_table: :user_roles 
  # def has_role?(role)
    # logger.debug "def has_role in user.rb : role is #{role}"
    # self.roles.count(:conditions => ['name = ?', role]) > 0
  # end  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         
  validates :password, presence: true, length: {minimum: 5, maximum: 120}, on: :create
  validates :password, length: {minimum: 5, maximum: 120}, on: :update, allow_blank: true

  # Removes the necessity of accepting an invitation
  def block_from_invitation?
    false
  end
         
  # Assign User Roles After Devise Registers a User, RegistrationsController > after_sign_up_path_for
  def assign_role(user_id, role_id)
    user_role = UserRole.new
    user_role.user_id = user_id
    user_role.role_id = role_id
    user_role.save
  end
  
    def admin(current_user_id)
        result = false
        user_role = UserRole.find_by_user_id(current_user_id) 
        role_id = user_role.role_id
        result = true if role_id == 1
        return result
    end
    
    def campaign_manager(current_user_id)
        result = false
        user_role = UserRole.find_by_user_id(current_user_id)
        role_id = user_role.role_id
        result = true if role_id == 2
        return result     
    end
    
    def specialist(current_user_id)
        result = false
        user_role = UserRole.find_by_user_id(current_user_id) 
        role_id = user_role.role_id
        result = true if role_id == 3
        return result
    end

    
       
   def name
     "#{self.first_name}" + " " + "#{self.last_name}"
   end   
end
