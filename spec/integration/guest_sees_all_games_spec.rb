require 'rails_helper'

RSpec.feature "Games" do
  scenario "retrieves all games" do
    game_1 = Game.create!(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    game_2 = Game.create!(name: "Burn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    visit '/'

    click_on "All Games"

    expect(current_path).to eq(games_path)

    within(".index-header") do
      expect(page).to have_content("All Gametime Games")
    end

    expect(page).to have_link("Play the Game!")
    expect(page).to have_link("Check out the Code!")
    expect(page).to have_content(game_2.name)
  end

end
