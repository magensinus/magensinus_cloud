# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :subscription, only: [:show, :edit, :update, :destroy]

  # Index
  # -----
  def index
    @subscriptions = Subscription.all
  end

  # Show
  # ----
  # GET /subscriptions/836JkSt8U
  def show
  end

  # Edit
  # ----
  # GET /subscriptions/836JkSt8U/edit
  def edit
  end

  # Update
  # ------
  # PATCH/PUT /subscriptions/836JkSt8U
  def update
    if @subscription.update(subscription_params)
      flash[:notice] = "Successfully updated..."
      redirect_to subscription_path(@subscription)
    else
      render :edit
    end
  end

  # Destroy
  # -------
  # DELETE /subscriptions/836JkSt8U
  def destroy
    @subscription.destroy
    flash[:notice] = "Successfully destroyed..."
    redirect_to subscriptions_path
  end

  # New
  # ---
  # GET /subscriptions/new
  def new
    @subscription = Subscription.new
  end

  # Create
  # ------
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

  # Subscription
  def subscription
    @subscription = Subscription.find_by(slug: params[:id])
  end

  # Whitelist parameters
  def subscription_params
    params.require(:subscription).permit(
      :email,
      :accept_terms
    )
  end
end
