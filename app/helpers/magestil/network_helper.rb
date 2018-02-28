# frozen_string_literal: true

module Magestil
  module NetworkHelper
    # Magestil Network form url
    def magestil_network_form_url
      if params_new || params_create
        magestil_networks_path
      else
        magestil_network_path
      end
    end
  end
end
