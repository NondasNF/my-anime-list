class CreateFavoriteAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_animes do |t|
      t.integer :anime_id
      t.integer :user_id

      t.timestamps
    end
  end
end
