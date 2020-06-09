class Api::UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password:params[:password],
      password_confirmation:params[:password_confirmation],
    )
    
    # Happy/sad paths for creating users:
    if (user.save)        # if user is saved successfully
      render json: { message: "User created usccessfully" }, status: :created
    else                  # if user not saved successfully
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end

  end

end
