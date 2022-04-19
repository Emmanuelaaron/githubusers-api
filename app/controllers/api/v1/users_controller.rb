class Api::V1::UsersController < ApplicationController
  before_action :authentication, except: %i[signup login]

  def signup
    user = User.create(user_params)
    if user.save
      token = encode_user_data({ user_data: user.id })
      render json: {
        message: 'user created successfully',
        token: token,
        code: 201
      }
    else
      render json: user.errors.messages
    end
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
