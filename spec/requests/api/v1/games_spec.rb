require 'rails_helper'

RSpec.describe "Games API", type: :request do
  it "retrieves all games" do
    game_1 = Game.create(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    game_2 = Game.create(name: "Burn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    get '/api/v1/games'

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json.count).to eq(Game.count)
  end

  it "retrieves one game" do
    game_1 = Game.create(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    game_2 = Game.create(name: "Burn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    get "/api/v1/games/#{game_1.id}"

    expect(response).to be_success

    json = JSON.parse(response.body)

    expect(json["name"]).to eq(game_1.name)
    expect(json["github_url"]).to eq(game_1.github_url)
    expect(json["heroku_url"]).to eq(game_1.heroku_url)
    expect(json["screenshot_or_gif"]).to eq(game_1.screenshot_or_gif)
  end

  # it "creates a new game" do
  #   game = Game.create(name: "thing")
  #   user = User.create(game_id: game.id)
  #
  #   stub_omniauth
  #
  #   params = {game:
  #             { name: 'bob', github_url:"blah", heroku_url: "kid", screenshot_or_gif: "pop" }
  #             }
  #
  #   post "/api/v1/games", params
  #
  #   expect(response).to be_success
  #   get "/api/v1/games"
  #
  #
  #   json = JSON.parse(response.body)
  #
  #   expect(json.second["name"]).to eq("bob")
  #   expect(json.second["github_url"]).to eq("blah")
  #   expect(json.second["heroku_url"]).to eq("kid")
  #   expect(json.second["screenshot_or_gif"]).to eq("pop")
  #
  #   expect(Game.count).to eq(2)
  # end

  it "can update a game" do
    Game.create(name: "Burn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")
    game = Game.create(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    user = User.create(game_id: game.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get "/api/v1/games/#{game.id}"

    json = JSON.parse(response.body)

    expect(json["name"]).to eq(game.name)
    expect(json["github_url"]).to eq(game.github_url)
    expect(json["heroku_url"]).to eq(game.heroku_url)
    expect(json["screenshot_or_gif"]).to eq(game.screenshot_or_gif)

    params =  { game: { id: game.id, name: 'bob' }}

    patch "/api/v1/games/#{game.id}", params
    expect(response).to be_success

    game.reload

    get "/api/v1/games/#{game.id}"

    json = JSON.parse(response.body)

    expect(json["name"]).to eq("bob")
    expect(json["github_url"]).to eq("https://github.com/jeneve/typrr-burn")
    expect(json["heroku_url"]).to eq("https://jeneve.github.io/typrr-burn/")
    expect(json["screenshot_or_gif"]).to eq("http://recordit.co/bni8wbO2My")
  end

  it "can delete a game" do
    game_1 = Game.create(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    get "/api/v1/games"

    json = JSON.parse(response.body)

    expect(json.first["name"]).to eq(game_1.name)

    delete "/api/v1/games/#{game_1.id}"

    expect(response).to be_success

    get "/api/v1/games"

    json = JSON.parse(response.body)

    expect(json).to eq([])
  end
end
