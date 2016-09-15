class Api::V1::GamesController < ApiBaseController

  def index
    render json: Game.all
  end

  def show
    render json: Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      User.assign_game(current_user.id, @game.id)
      render json: @game
    else
      render json: { errors: @game.errors }, status: 500
    end
  end

  def update
    game = Game.find(game_params[:id])
    render json: game.update(game_params)
  end

  def destroy
    render json: Game.destroy(params[:id])
  end

  private
    def game_params
      params.require(:game).permit(:name, :github_url, :heroku_url, :screenshot_or_gif, :id)
    end
end
