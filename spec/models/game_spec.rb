require 'rails_helper'

RSpec.describe Game, type: :model do
  it "can assign a game an" do
    Game.create(name: "Burn",
                github_url: "https://github.com/jeneve/typrr-burn",
                heroku_url: "https://jeneve.github.io/typrr-burn/",
                screenshot_or_gif: "http://recordit.co/bni8wbO2My")
  game = Game.create(name: "TBurn",
                github_url: "https://github.com/jeneve/typrr-burn",
                heroku_url: "https://jeneve.github.io/typrr-burn/",
                screenshot_or_gif: "http://recordit.co/bni8wbO2My")
    user = User.create(username: "pop", game_id: game.id)

    expect(game.owner).to eq("jeneve")
    expect(game.repo).to eq("typrr-burn")
    
  end
end
