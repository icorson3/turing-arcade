class Game < ApplicationRecord
  has_many :users, dependent: :destroy

  before_save :create_slug
  before_update :require_user

  validates :github_url, url: true, presence: true
  validates :name, presence: true
  validates :screenshot_or_gif, presence: true
  validates :heroku_url, url: true, presence: true

  def create_slug
    self.slug = self.name.parameterize
  end

  def owner
    github_url.split("/")[-2]
  end

  def repo
    github_url.split("/")[-1]
  end
end
