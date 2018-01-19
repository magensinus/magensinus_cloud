# frozen_string_literal: true

class CreateSubscriptionsEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions_emails do |t|
      t.string :slug, unique: true, index: true
      t.string :email, unique: true

      t.timestamps
    end
  end
end
