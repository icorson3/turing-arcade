require 'rails_helper'

RSpec.feature "github user's dashboard" do
  scenario "can see info on dashboard" do
    user = stub_omniauth

    game = Game.create(name: "test",
                        heroku_url: "test",
                        github_url: "test",
                        screenshot_or_gif: "test")
    visit '/'


    expect(page).to have_link("Sign in with Github")
    expect(page).to have_link("Browse All Games")

  end
end
