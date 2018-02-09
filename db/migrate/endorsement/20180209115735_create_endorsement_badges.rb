# frozen_string_literal: true

class CreateEndorsementBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :endorsement_badges do |t|
      t.string    :slug, unique: true, index: true

      t.string    :title
      t.text      :description
      t.string    :url

      t.boolean   :thumb, default: false
      t.string    :thumb_box
      t.string    :thumb_caption

      t.boolean   :published, default: false

      t.boolean   :eml, default: false
      t.boolean   :magestil, default: false
      t.boolean   :magensinus, default: false

      t.integer   :position

      t.timestamps
    end
  end
end
