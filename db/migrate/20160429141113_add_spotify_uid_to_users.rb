class AddSpotifyUidToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :spotify_uid, :null => false, :default => ''
    end

    add_index :users, :spotify_uid, unique: true
  end
end
