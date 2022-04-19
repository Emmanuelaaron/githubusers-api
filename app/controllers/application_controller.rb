class ApplicationController < ActionController::API
  SECRET = 'MYCOOLSECRETKEY'.freeze

  def verify_authentication
    decode_data = decode_user_data(request.headers['token'])

    decode_data || false
  end

  def authentication
    if verify_authentication
      user_id = verify_authentication[0]['user_data']
      user = User.find(user_id)
      if user
        true
      else
        render json: { message: 'UnAuthorized Contact Admin', code: 401 }
      end
    else
      render json: { message: 'UnAuthorized', code: 401 }
    end
  end

  def encode_user_data(payload)
    JWT.encode payload, SECRET, 'HS256'
  end

  def decode_user_data(token)
    JWT.decode token, SECRET, true, { algorithm: 'HS256' }
  rescue StandardError => e
    puts e
  end
end
