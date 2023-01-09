class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role.id == 2
      @branch_office = BranchOffice.find(current_user.branch_office_id)
    elsif current_user.role.id == 3
      #@slope_appointments = Appointment.find_by_user_id_and_state_id(current_user, 1)
      @slope_appointments = Appointment.where(user: current_user, state_id: 1)
      #@attended_appointments = Appointment.find_by_user_id_and_state_id(current_user, 3)
      @attended_appointments = Appointment.where(user: current_user, state_id: 2)
    end
  end
end
