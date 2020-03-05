# frozen_string_literal: true

class AlertsController < ApplicationController
  def create
    alerts = Alert.new(alert_params)
    if alerts.save
      render json: { message: alerts }, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  private

  def alert_params
    params.require(:alert).permit(:sender, :message)
  end
end
