require 'rails_helper'

RSpec.feature "Game" do
  scenario "retrieves info about one with a slug" do
    game = Game.create(name: "Burn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    game_1 = Game.create(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    visit "/#{game_1.slug}"

    expect(current_path).to eq(game_path(game_1.slug))
    expect(page).to have_content(game_1.name)
  end
end
