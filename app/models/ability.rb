class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)
      if user.roles.present?
           _user = User.find(user)
           print "\n class Ability : _user.id is #{_user.id} \n"
           
           _roles = UserRole.where('user_id = ?',_user.id ).first
           print "\n class Ability : _user.id is #{_roles.inspect} \n"
           
             _roles = UserRole.where('user_id = ?',_user.id).first
    
           if _roles.role_id == 1 # Admin
             print "-----------------administrator-------------------"
             can [:manage], [Ctype, Vtype, Metric, Kpi, Customer, Vendor, Campaign, Question, Response, Graph]
           elsif _roles.role_id == 2 # Director
             print "-----------------director-------------------"
             cannot [:manage], [Ctype, Vtype, Metric, Kpi]
             can [:manage], [Campaign, Vendor, Graph]
             can [:update], [Customer]
             can [:read], [Question, Response]
           elsif _roles.role_id == 3 # Specialist
             print "-----------------specialist-------------------"
             cannot [:manage], [Ctype, Vtype, Metric, Kpi, Customer]
             can [:manage], [Campaign, Vendor, Graph]
             can [:read], [Question, Response]
           end
      
      else
        print "-----------guest------------"
       can [:update], [Campaign, Question]
       can [:survey], [Campaign]
       can [:create], [Response]
      end
  end 
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
