class MadeupAnswersController < ApplicationController
  def create

    @madeup_answer = MadeupAnswer.new(user: current_user, content: params["madeup_answer"]["content"], round: Round.find(7))
    @madeup_answer.save

    redirect_to room_game_path(params[:room_id], params[:game_id])
    binding.pry
  end

private

  def madeup_answer_params
    params.require(:madeup_answer).permit(:content)
  end
end
