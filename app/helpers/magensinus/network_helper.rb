# frozen_string_literal: true

module Magensinus
  module NetworkHelper
    # Magensinus Network form url
    def magensinus_network_form_url
      if params_new || params_create
        magensinus_networks_path
      else
        magensinus_network_path
      end
    end
  end
end
