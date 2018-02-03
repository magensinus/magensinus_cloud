# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]

  # GET /subscriptions
  def index
    @subscriptions = Subscription.all
  end

  # GET /subscriptions/836JkSt8U
  def show
  end

  # GET /subscriptions/836JkSt8U/edit
  def edit
  end

  # PATCH/PUT /subscriptions/836JkSt8U
  def update
    if @subscription.update(subscription_params)
      flash[:notice] = "Successfully updated..."
      redirect_to subscription_path(@subscription)
    else
      render :edit
    end
  end

  # DELETE /subscriptions/836JkSt8U
  def destroy
    @subscription.destroy
    flash[:notice] = "Successfully destroyed..."
    redirect_to subscriptions_path
  end

  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      flash[:notice] = "Successfully created..."
      redirect_to subscription_path(@subscription)
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subscription
    @subscription = Subscription.find_by(slug: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscription_params
    params.require(:subscription).permit(
      :email,
      :active
    )
  end
end
