# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string  :slug, unique: true, index: true
      t.string  :name
      t.string  :surname
      t.string  :email, unique: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
