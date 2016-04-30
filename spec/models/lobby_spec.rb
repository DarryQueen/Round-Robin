require 'rails_helper'

RSpec.describe Lobby, :type => :model do
  let(:user) {
    User.create(:email => 'test@gmail.com', :password => 'ohnoapassword')
  }
  let(:playlist_id) { '235lzkkl3j5sd' }

  context 'for uninitialized lobby' do
    let(:lobby) { Lobby.create }

    it 'returns uninitialized fields' do
      l = Lobby.find(lobby.id)
      l.users.should == []
      l.playlists.should == []
    end
  end

  context 'for initialized lobby' do
    let(:lobby) {
      l = Lobby.new
      l.playlists_by_user_id = { user.id => playlist_id }
      l.save
      l
    }

    it 'returns initialized fields' do
      l = Lobby.find(lobby.id)

      l.users.should include(user)
      l.playlists.should include(playlist_id)
    end
  end
end
