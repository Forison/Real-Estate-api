class AlertsController < ApplicationController
	 def create 
		alerts = Alert.new(alert_params)
    if alerts.save
      render json: alerts, status: :created
    else
      head(:unprocessable_entity)
    end
	 end
	 private 
	 def alert_params
		params.require(:alert).permit(:sender, :message )
	 end
end
