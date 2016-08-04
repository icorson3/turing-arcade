class User < ApplicationRecord
  belongs_to :game

  validates :username, presence: true, uniqueness: true

  enum role: { default: 0 , business_admin: 1 }

  def self.from_omniauth(auth_info)
    User.find_or_create_by(uid: auth_info.uid) do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.info.nickname
      new_user.avatar             = auth_info.info.image
      new_user.oauth_token        = auth_info.credentials.token
      new_user.role               = "default"
      new_user.game_id            = 1
    end
  end

  def self.assign_game(current_user_id, id)
    user = User.find(current_user_id)
    user.update(game_id: id)
    user.save
  end


end
