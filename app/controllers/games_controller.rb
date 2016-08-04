class GamesController < ApplicationController

  def index
    @games = Game.where.not(id: 1)
  end

  def show
    @game = Game.find_by(slug: params[:game_slug])
    @collaborators = Github.find_collaborators(@game.owner, @game.repo)
  end
end
