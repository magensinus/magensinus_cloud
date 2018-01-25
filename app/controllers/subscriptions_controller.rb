class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/1
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to subscription_path(@subscription), notice: 'Subscription email was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscriptions_params)
      redirect_to subscription_path(@subscription), notice: 'Subscription email was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
    redirect_to subscriptions_path, notice: 'Subscription email was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find_by(slug: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(
      :email
    )
  end
end
