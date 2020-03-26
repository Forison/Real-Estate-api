class AlertsController < ApplicationController
  def create
    alert = Alert.new(alert_params)
    if alert.save
      head(:ok)
    else
      head(:unprocessable_entity)
    end
   end

  private

  def alert_params
    params.require(:alert).permit(:sender, :message)
  end
end
