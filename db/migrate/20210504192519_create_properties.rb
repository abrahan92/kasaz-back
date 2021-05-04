# frozen_string_literal: true

# Property migration file
class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :sqm
      t.float :price
      t.integer :bedrooms
      t.integer :bathrooms

      t.timestamps
    end
  end
end
