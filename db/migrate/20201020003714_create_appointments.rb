class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :stylist_id
      t.integer :style_id
      t.datetime :date

      t.timestamps
    end
  end
end
