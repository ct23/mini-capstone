class Api::SessionsController < ApplicationController

  def create
    # Try to find user using their provided email parameter
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])     # check whether user exists, whether password is correct
      jwt = JWT.encode(
        {
          user_id: user.id,                 # the data to encode
          exp: 24.hours.from_now.to_i       # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base),    # the secret key
        "HS256"                                                   # the encryption algorithm
      )
      render json: { jwt: jwt, email: user.email, user_id: user.id }
    else
      render json: {}, status: :unauthorized
    end
  
  end

end
