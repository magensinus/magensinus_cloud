# frozen_string_literal: true

class AddSubtitleToMagensinusHome < ActiveRecord::Migration[5.1]
  def change
    add_column :magensinus_home, :subtitle, :string
  end
end
