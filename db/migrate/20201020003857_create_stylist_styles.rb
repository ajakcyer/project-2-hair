class CreateStylistStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :stylist_styles do |t|
      t.integer :stylist_id
      t.integer :style_id
      t.integer :price
      t.string :style_img_url

      t.timestamps
    end
  end
end
