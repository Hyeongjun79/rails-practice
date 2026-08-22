class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.integer :steam_appid
      t.string :name
      t.integer :original_price
      t.integer :final_price
      t.integer :discount_percent
      t.string :header_image

      t.timestamps
    end
  end
end
