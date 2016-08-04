class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :github_url, :heroku_url, :screenshot_or_gif, :slug
end
