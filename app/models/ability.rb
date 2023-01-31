# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    can [:show, :edit, :update, :editPassword], User, User.all do |item|
      item == user
    end

    unless user.role.name == "Administrador"
      if user.role.name == "Cliente"
        puts "soy Cliente"
        can :manage, BranchOffice

        can [:show, :create, :update], Appointment
        
      else  
        puts "Soy personal"
        can [:show, :appointments], BranchOffice, BranchOffice.all do |item|
          item.id == user.branch_office_id
        end

        can [:show, :update], Appointment.all do |item|
          item.branch_office.id == user.branch_office_id
        end

      end
    else
      puts "Soy administrador"
      can :manage, Province
      can :manage, Location
      can :manage, BranchOffice

      can :manage, AttentionTime
      can :manage, WorkingDay

      can :manage, User
    end





    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
