class ProgressesController < ApplicationController

  def new
    @progress = Progress.new
    @question = Question.first
  end

  def create
    current_game = Game.find(params[:game_id])

    progress = current_game.progresses.new(cereate_params)
    progress.assign_sequence
    progress.save!

    redirect_to new_game_progress_path(current_game)
  end


  private

  def cereate_params
    params.require(:progress).permit(:question_id,:answer)
  end
  

end
