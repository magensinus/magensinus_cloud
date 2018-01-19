module Subscriptions
  class EmailsController < ApplicationController
    before_action :set_subscriptions_email, only: [:show, :edit, :update, :destroy]

    # GET /subscriptions_emails
    def index
      @subscriptions_emails = Subscriptions::Email.all
    end

    # GET /subscriptions_emails/1
    def show
    end

    # GET /subscriptions_emails/new
    def new
      @subscriptions_email = Subscriptions::Email.new
    end

    # GET /subscriptions_emails/1/edit
    def edit
    end

    # POST /subscriptions_emails
    def create
      @subscriptions_email = Subscriptions::Email.new(subscriptions_email_params)

      if @subscriptions_email.save
        redirect_to @subscriptions_email, notice: 'Subscriptions email was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /subscriptions_emails/1
    def update
      if @subscriptions_email.update(subscriptions_email_params)
        redirect_to @subscriptions_email, notice: 'Subscriptions email was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /subscriptions_emails/1
    def destroy
      @subscriptions_email.destroy
      redirect_to subscriptions_emails_url, notice: 'Subscriptions email was successfully destroyed.'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_subscriptions_email
      @subscriptions_email = Subscriptions::Email.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriptions_email_params
      params.require(:subscriptions_email).permit(
        :email
      )
    end
  end
end
