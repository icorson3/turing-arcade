class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  
  before_save :create_slug

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
