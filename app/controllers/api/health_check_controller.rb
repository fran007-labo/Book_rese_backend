class Api::HealthCheckController < ApplicationController
  skip_before_action :authenticate_user
  def index
    logger.info "============================================================"
    logger.info "ReuqestUrl: #{request.url}"
    render json: {status: 200}, status: 200
  end
end