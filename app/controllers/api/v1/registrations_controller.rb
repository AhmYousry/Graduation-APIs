class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    role = registration_params[:role]

    if role == 'doctor'
      @user = Pending.new(registration_params)
    elsif role == 'patient'
      @user = User.new(registration_params)
    else
      render json: { error: 'Invalid role' }, status: :unprocessable_entity
      return
    end

    if @user.save
      if role == 'doctor'
        render json: { message: 'Registration is pending, Waiting approvement from admins' }, status: :created
      elsif role == 'patient'
        render json: { message: 'Registration successful' }, status: :created
      end
    else
      render json: { error: @user.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end
  
  private

  def registration_params
    params.require(:registration).permit(:email, :password, :password_confirmation, :name, :role)
  end
end
