require 'rails_helper'

RSpec.feature "visitor_can_see_homepage_options" do
  scenario "visitor sees homepage with options to links" do
    visit '/'

    within("h1") do
      expect(page).to have_content("Turing Arcade")
    end

    expect(page).to have_link("Sign in with Github")
    expect(page).to have_link("Browse All Games")
  end

  scenario "visitor can log in with github" do
      user = stub_omniauth

    visit '/'

    click_on "Sign in with Github"
    expect(page).to have_link("Sign in with Github")
    expect(page).to have_link("Browse All Games")
  end
end
