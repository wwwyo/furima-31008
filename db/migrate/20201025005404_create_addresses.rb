class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false
      t.integer :delivery_prefecture_id, null: false
      t.string :delvery_town, null: false
      t.string :delivery_number, null: false
      t.string :delivery_building
      t.string :phon_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
