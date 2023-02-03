class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :find_user, only: %i[ show edit update destroy editPassword]

  #GET /users
  def index
    user = User.all
    @admins = user.select {|item| item.role_id == 1}
    @personals = user.select {|item| item.role_id == 2}
    @clients = user.select {|item| item.role_id == 3}
  end

  #GET /users/new
  def new
    @user = User.new
    @url = admin_create_users_path
    @button_text = "Crear nuevo usuario"
  end

  #POST /users
  def create
    @user = User.create(user_params)

    if @user.invalid?
      return redirect_to admin_new_users_path, alert: @user.errors.full_messages.first
    end

    redirect_to users_path, notice: "El usuario se a registrado correctamente"
  end

  #GET /users/:id
  def show
  end

  #GET /users/:id/edit
  def edit
    @edit = true
    @url = @user
    @button_text = "Actualizar usuario"
  end

  #PATCH /users/:id    
  def update
    @user.update(user_params)

    if @user.invalid?
      return redirect_to edit_user_path(@user), alert: @user.errors.full_messages.first
    end

    redirect_to @user, notice: "Se ha actualizado el usuario correctamente"
  end

  #DELETE /users
  def destroy
    if (@user == current_user)
      return redirect_to @user, alert: "No puedes eliminar tu propia cuenta"
    else
      @user.destroy
      redirect_to users_path, notice: "El usuario fue eliminado satisfactoriamente"
    end
  end

  #GET /users/:id/editPassword
  def editPassword 
    @url = updatePassword_user_path(@user)
  end

  #PATCH /users/:id/updatePassword
  def updatePassword
    @user.update(user_params)

    if @user.invalid?
      return redirect_to editPassword_user_path(@user), alert: @user.errors.full_messages.first
    end

    redirect_to @user, notice: "Se ha actualizado el usuario correctamente"
  end

  private 
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email.downcase, :name, :surname, :password, :password_confirmation, :role_id, :branch_office_id)
    end

end