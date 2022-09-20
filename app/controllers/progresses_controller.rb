class ProgressesController < ApplicationController

  def new
    @progress = Progress.new
    current_game = Game.find(params[:game_id])
    @question = Question.next_question(current_game)
  end

  def create
    current_game = Game.find(params[:game_id])

    progress = current_game.progresses.new(cereate_params)
    progress.assign_sequence
    progress.save!

    next_question = Question.next_question(current_game)
    if next_question.blank?

      current_game.status = 'finished'
      current_game.result = 'incorrect'
      current_game.save!

      redirect_to give_up_game_path(current_game)
      return
    end
    

    redirect_to new_game_progress_path(current_game)
    
  end


  private

  def cereate_params
    params.require(:progress).permit(:question_id,:answer)
  end
  

end
