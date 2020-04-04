class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    @round_set = Round.where(game: @game)
  end

  def create
    @game = Game.new(room: current_user.room)
    @game.save

    # Generate the question set with five random questions
    question_set = Question.all.sample(5)
    counter = 0

    5.times do
      Round.create(game: @game, question: question_set[counter])
      counter += 1
    end
    binding.pry

    redirect_to room_game_path(@game)
  end
end
