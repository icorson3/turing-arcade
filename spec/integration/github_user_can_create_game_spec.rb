# require 'rails_helper'
#
# RSpec.feature "Create new game" do
#   scenario "user sees a form to create game" do
#     stub_omniauth
#
#     visit '/'
#
#     click_on "Sign in with Github"
#
#     visit '/games'
#
#     expect(page).to have_selector("input[value='Name']")
#     expect(page).to have_selector("input[value='Heroku Url']")
#     expect(page).to have_selector("input[value='Github Url']")
#     expect(page).to have_selector("input[value='Gif']")
#     expect(page).to have_selector("input[value='Add My Game!']")
#
#     #need to figure out how to fill out that input form to submit a new game
#     click_on "Add My Game!"
#
#     expect(current_path).to eq(games_path)
#   end
# end
