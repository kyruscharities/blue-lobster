class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest

    # call the method for each role to set permissions
    # (this allows for inherited roles)
    everyone
    @user.roles.each { |role| send(role.name) }
  end

  def everyone
  end

  def admin
    can :manage, :all
  end

  def veteran
    can [:create, :edit, :show, :update], Answer
    can [:answer, :index, :show], Question
    can [:index, :show], JobType
    can [:index, :show], Program
    can :manage, User, :id => @user.id
  end
end
