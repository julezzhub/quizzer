class MadeupAnswersController < ApplicationController
  def create
    @round = Round.where(game: params[:game_id])[params["madeup_answer"]["round_count"].to_i]
    @content = params["madeup_answer"]["content"]
    @madeup_answer = MadeupAnswer.new(user: current_user, content: @content, round: @round)
    @madeup_answer.save

    ActionCable.server.broadcast("game_#{params[:game_id]}", {
      round: params["madeup_answer"]["round_count"].to_i,
      user: current_user,
      content: @content
      })

    redirect_to room_game_path(params[:room_id], params[:game_id])
  end

private

  def madeup_answer_params
    params.require(:madeup_answer).permit(:content)
  end
end
