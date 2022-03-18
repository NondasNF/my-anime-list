class CreateFollowAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_animes do |t|
      t.boolean :favorite, :default => false
      t.integer :anime_id
      t.integer :user_id

      t.timestamps
    end
  end
end
