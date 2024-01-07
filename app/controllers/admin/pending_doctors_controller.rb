module Admin
    class PendingDoctorsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:accept]
      def index
        @pending_doctors = Pending.all
      end
  
      def show
        @pending_doctor = Pending.find(params[:id])
      end
  
      def new
        @pending_doctor = Pending.new
      end
  
      def create
        @pending_doctor = Pending.new(pending_doctor_params)
  
        if @pending_doctor.save
          redirect_to admin_pending_doctors_path, notice: 'Pending doctor created successfully.'
        else
          render :new
        end
      end
  
      def edit
        @pending_doctor = Pending.find(params[:id])
      end
  
      def update
        @pending_doctor = Pending.find(params[:id])
  
        if @pending_doctor.update(pending_doctor_params)
          redirect_to admin_pending_doctors_path, notice: 'Pending doctor updated successfully.'
        else
          render :edit
        end
      end
  
      def destroy
        @pending_doctor = Pending.find(params[:id])
        @pending_doctor.destroy
  
        redirect_to admin_pending_doctors_path, notice: 'Pending doctor deleted successfully.'
      end

      def accept
        @pending_doctor = Pending.find(params[:id])
        user_params = @pending_doctor.attributes.slice('name', 'email', 'password', 'password_confirmation', 'role')
        user_params['role'] = 'doctor'
  
        existing_user = User.find_by(email: user_params['email'])
  
        if existing_user
          Rails.logger.error("Error: User with email #{user_params['email']} already exists.")
          redirect_to admin_pending_doctors_path, alert: 'Error accepting doctor: User with the same email already exists.'
        else
          user = User.new(user_params)
          if user.save
            @pending_doctor.destroy
            redirect_to admin_pending_doctors_path, notice: 'Doctor accepted and moved to User table.'
          else
            Rails.logger.error("Error saving user: #{user.errors.full_messages}")
            redirect_to admin_pending_doctors_path, alert: 'Error accepting doctor.'
          end
        end
      end
      
  
      private
  
      def pending_doctor_params
        params.require(:pending_doctor).permit(:name, :email, :password, :password_confirmation, :role)
      end
    end
  end
  