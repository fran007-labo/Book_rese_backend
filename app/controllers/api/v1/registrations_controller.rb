class Api::V1::RegistrationsController < ApplicationController

  # サインイン/サインアウト
  def create
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?
    user = User.find_by(uid: payload['user_id'])
    if user == nil
      user = User.create!(sign_up_params)
      render json: user, status: :ok
    else
    end
  end

  private

  def sign_up_params
    params.require(:registration).permit(:email, :name, :uid)
  end

  def token_from_request_headers
    request.headers['Authorization']&.split&.last
  end

  def token
    params[:token] || token_from_request_headers
  end

  def payload
    @payload ||= FirebaseIdToken::Signature.verify token
  end
end 