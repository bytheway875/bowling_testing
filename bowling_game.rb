class BowlingGame
  def initialize
    @rolls=[]
  end
  
  #Adds the number of pins knocked down on each roll to the rolls array.
  def roll(pins)
    @rolls.push(pins)
  end
  
  #Scores one game of bowling.
  def score
    @total_score = 0
    @current_roll = 0
    @frame = 1

    while rolls?
      set_roll_logic
      if @frame > 10
        return @total_score
      else
        score_frame
      end
    end
    return @total_score
  end
   
  private

  #Sets the logic for a roll, the next roll, and the "next-next" roll to help score strikes and spares.
  def set_roll_logic
    @roll = @rolls[@current_roll]
    @next_roll = @rolls[@current_roll +1]
    @rolls[@current_roll +2] ? @first_roll_next_frame = @rolls[@current_roll +2] : @first_roll_next_frame = 0
  end
  
  #Scores a strike frame, which adds the score from the next two rolls.
  def strike_frame
    @total_score += 10 + @next_roll + @first_roll_next_frame
    @current_roll +=1
  end
  
  #Scores a spare frame, which adds the first roll from the next frame
  def spare_frame
    @total_score += 10 + @first_roll_next_frame
    @current_roll += 2
  end
  
  #Scores any frame that is not a strike or a spare
  def regular_frame
    @total_score += @roll + @next_roll
    @current_roll +=2
  end
  
  #Determines whether a frame is a "strike"(knocks down ten pins in one roll)
  def strike?
    @roll == 10
  end

  #Determines whether a frame is a "spare" (all ten pins are knocked down after two consecutive rolls in one frame)
  def spare?
    @roll + @next_roll == 10
  end
  
  #Determines whether there are still rolls left to score.
  def rolls?
    @current_roll < @rolls.size-1
  end
  
  #Combines logic to see what type of roll each frame was, then scores each frame, then increments the frame by one to continue scoring.
  def score_frame
    if strike?
      strike_frame
    elsif spare?
      spare_frame
    else
      regular_frame
    end

    @frame += 1
  end
end
