class CreateStylists < ActiveRecord::Migration[6.0]
  def change
    create_table :stylists do |t|
      t.string :name
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
