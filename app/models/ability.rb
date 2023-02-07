# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    can [:show, :edit, :update, :editPassword, :updatePassword], User, User.all do |item|
      item == user
    end

    unless user.role_id == 1
      if user.role_id  == 3
        puts "soy Cliente"

        can [:index, :show], BranchOffice 
        can [:new, :create], Appointment
        can [:edit, :show, :update, :cancel], Appointment, Appointment.all do |item|
          item.user == user
        end

      else  
        puts "Soy personal"

        can [:index, :show], BranchOffice
        can [:appointments], BranchOffice, BranchOffice.all do |item|
          item.id == user.branch_office_id
        end

        can [:show, :attending, :register_attention], Appointment.all do |item|
          item.branch_office.id == user.branch_office_id
        end

        can [:index], User
        can [:show], User, User.all do |item|
          item.role_id == 3
        end

      end
    else
      puts "Soy administrador"

      can :manage, Province
      can :manage, Location
      can :manage, BranchOffice
      cannot :appointments, BranchOffice

      can :manage, AttentionTime
      can :manage, WorkingDay

      can :manage, User
      cannot [:editPassword, :updatePassword], User, User.all do |item|
        item.id != user.id
      end
    end
    
  end
end
