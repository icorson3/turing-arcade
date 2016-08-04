require 'rails_helper'

RSpec.feature "user sees collaborators" do
  scenario "user the collaborators on a show page" do
    Game.create(name: "Burn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    game = Game.create(name: "TyprrBurn",
                          github_url: "https://github.com/jeneve/typrr-burn",
                          heroku_url: "https://jeneve.github.io/typrr-burn/",
                          screenshot_or_gif: "http://recordit.co/bni8wbO2My")

    visit '/games'

    click_on game.name

    expect(current_path).to eq("/typrrburn")
    


  end
end
