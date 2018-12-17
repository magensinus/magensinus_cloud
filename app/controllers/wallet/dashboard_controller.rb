# frozen_string_literal: true

module Wallet
  class DashboardController < ApplicationController
    # Show
    # ----
    def show
      if params[:published] == "true"
        @wallet_categories ||= Wallet::Category.where(published: true).order(position: :asc)
      elsif params[:published] == "false"
        @wallet_categories ||= Wallet::Category.where(published: false).order(position: :asc)
      else
        @wallet_categories ||= Wallet::Category.order(position: :asc)
      end
    end
  end
end
