class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  layout 'subscriptions'
  respond_to :html, :json

  def index
  end

 	def show
 	end

  def new
   	@subscription = Subscription.new
  end

  def create
  	@subscription = Subscription.new(subscription_params)
  	flash[:notice] = 'Subscription was successfully created.' if @subscription.save
  	respond_with(@subscription)
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(:user_id, :payment_plan_id, :stripe_customer_token)
  end
end
