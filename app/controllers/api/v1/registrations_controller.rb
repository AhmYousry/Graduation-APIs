module Api
    module V1
      class RegistrationsController < Devise::RegistrationsController
        skip_before_action :verify_authenticity_token
        respond_to :json
  
        def create
          build_resource(sign_up_params)
  
          if resource.save
            render json: { message: 'User created successfully', user: resource.as_json(only: [:id, :email]) }
        else
            render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        private
  
        def sign_up_params
          params.require(:user).permit(:email, :password, :password_confirmation, :role, :image)
        end
      end
    end
  end
  