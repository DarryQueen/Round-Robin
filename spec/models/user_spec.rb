require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:spotify_uid) { 'testspotifyuid111' }
  let(:email) { 'annawintour@vogue.com' }

  let(:auth) {
    OpenStruct.new({
      :uid => spotify_uid,
      :info => OpenStruct.new({
        :email => email
      })
    })
  }

  context 'for a new auth hash' do
    it 'should create a user' do
      count = User.count
      u = User.from_omniauth(auth)
      User.count.should == count + 1
    end
  end

  context 'for an existing auth hash' do
    let!(:user) {
      User.create(
        :spotify_uid => spotify_uid,
        :email => email,
        :password => 'ohnoapassword'
      )
    }

    it 'should not create a new user' do
      count = User.count
      u = User.from_omniauth(auth)
      User.count.should == count

      u.should == user
    end
  end
end
