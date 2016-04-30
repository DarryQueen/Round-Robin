class Lobby < ActiveRecord::Base
  belongs_to :host, :class_name => 'User'

  serialize :playlists_by_user_id

  after_initialize :default_values

  def users
    playlists_by_user_id.keys.map do |user_id|
      User.find(user_id)
    end
  end

  def playlists
    playlists_by_user_id.values
  end

  private

  def default_values
    self.playlists_by_user_id ||= {}
  end
end
