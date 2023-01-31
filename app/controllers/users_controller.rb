class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :authenticate_user!, except: %i[ show ]
  load_and_authorize_resource
  #skip_authorize_resource only: :new
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
  end

  #POST /users
  def create
    message = validate_params(params[:user][:email], params[:user][:password], params[:user][:password_comfirmation])
    if message
      return redirect_to admin_new_users_path , alert: message
    end

    @user = User.create(user_params)
    if current_user.nil?
      redirect_to new_user_session_path, notice: "Registrado correctamente, puede iniciar sesion"
    else 
      redirect_to users_path, notice: "El usuario se a registado correctamente"
    end
  end

  #GET /users/:id
  def show
  end

  #GET /users/:id/edit
  def edit
    @edit = true
    @url = @user
  end

  #PATCH /users/:id    
  def update
    message = validate_params(params[:user][:email], params[:user][:password], params[:user][:password_comfirmation])
    if message
      return redirect_to edit_user_path(@user), alert: message
    end

    @user.update(user_params)
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
    @url = @user
  end

  private 
    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :name, :surname, :password, :password_confirmation, :role_id, :branch_office_id)
    end

    def validate_params(email, password, password_comfirmation)
      message = nil

      if email
        email = email.downcase
        
        if User.where(email: email).any?
          unless @user && User.where(email: email).first.id == @user.id
            message = "El mail seleccionado se encuentra en uso"
          end
        end
      end 
        
      if password
        if password.size < 6
          message = "La contraseña debe poseer al menos 6 caracteres"
        end

        if password != password_comfirmation
          messague = "Las contraseñas ingresadas no coinciden"
        end
      end
      message
    end 
end