class GamesController < ApplicationController
  def index
    @games = Game.order(discount_percent: :desc)
  end
end
