class Api::V1::Users::SignOutsController < ApplicationController
  skip_before_action :authenticate_user
  
	# ログアウト
  def create
  	current_user = nil
  end
end
