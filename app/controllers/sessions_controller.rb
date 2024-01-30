class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        user = User.find_by(email: params[:email])
    
        if user && user.valid_password?(params[:password])
          sign_in(user)  # Use Devise's sign_in method
          render json: { message: 'Successfully signed in!' }
        else
          render json: { message: 'Invalid email or password' }, status: :unauthorized
        end
      end
  
    def destroy
      # Implement sign-out logic if needed
      render json: { message: 'Successfully signed out!' }
    end
  end
  