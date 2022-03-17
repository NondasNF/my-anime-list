class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :classification
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
