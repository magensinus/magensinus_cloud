# frozen_string_literal: true

module Wallet
  class DashboardController < ApplicationController
    # Show
    # ----
    def show
      @wallet_categories =
        if params[:published] == "true"
          Wallet::Category.where(published: true).order(position: :asc)
        elsif params[:published] == "false"
          Wallet::Category.where(published: false).order(position: :asc)
        else
          Wallet::Category.order(position: :asc)
        end
    end
  end
end
