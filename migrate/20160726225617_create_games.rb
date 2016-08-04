class CreateGames < ActiveRecord::Migration[5.0]
  def change
    enable_extension("citext")
    create_table :games, :force => true do |t|
      t.citext :name
      t.citext :github_url
      t.citext :heroku_url
      t.citext :screenshot_or_gif

      t.timestamps
    end
  end
end
