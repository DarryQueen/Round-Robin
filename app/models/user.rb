class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    User.where(:spotify_uid => auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.spotify_uid = auth.uid
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
