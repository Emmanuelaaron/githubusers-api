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

  def login
    user = User.find_by(username: user_params[:username])
    if user&.authenticate(user_params[:password])
      token = encode_user_data({ user_data: user.id })
      render json: {
        message: 'user logged in successfully!',
        token: token,
        code: 200
      }
    else
      render json: {
        message: 'Invalid loggin credentials',
        code: 406
      }
    end
  end

  def api_call
    response = RestClient.get "https://github-trending-api.de.a9sapp.eu/developers?language=#{api_call_param[:lang]}"
    json = JSON.parse(response)
    output = []
    json.each do |item|
      item_output = {}
      item_output.store('name', item['name'])
      item_output.store('username', item['username'])
      item_output.store('avatar', item['avatar'])
      item_output.store('repo', {})
      item_output['repo'].store('name', item['repo']['name'])
      item_output.store('description', item['repo']['description'])
      item_output.store('url', item['repo']['url'])
      output << item_output
    end
    render json: output
  end

  private

  def user_params
    params.permit(:username, :password)
  end

  def api_call_param
    params.permit(:lang)
  end
end
