class SubscriptionsController < ApplicationController
	before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  layout 'subscriptions'

  def new
  	@current_user ||= User.first
  	if @current_user
			@subscription = Subscription.new
		else
			redirect_to new_user_session_path
		end
  end

  def create
  	@subscription = Subscription.new(subscription_params)
		if @subscription.save
			format.html { redirect_to new_project_path, notice: 'Subscription was successfully created.' }
      format.json { render action: 'show', status: :created, location: @subscription }
    else
      format.html { render action: 'new' }
      format.json { render json: @subscription.errors, status: :unprocessable_entity }
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:user_ud, :payment_plan_id)
    end
end