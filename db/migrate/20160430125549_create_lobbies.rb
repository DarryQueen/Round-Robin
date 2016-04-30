class CreateLobbies < ActiveRecord::Migration
  def change
    create_table :lobbies do |t|
      t.string :name
      t.belongs_to :host
      t.string :playlist_id

      # Store as a hash.
      t.text :playlists_by_user_id
    end
  end
end
