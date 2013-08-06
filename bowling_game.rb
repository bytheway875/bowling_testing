class BowlingGame
  def initialize
    @rolls=[]
  end

  def roll(pins)
    @rolls.push(pins)
  end

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

  def set_roll_logic
    @roll = @rolls[@current_roll]
    @next_roll = @rolls[@current_roll +1]
    @rolls[@current_roll +2] ? @first_roll_next_frame = @rolls[@current_roll +2] : @first_roll_next_frame = 0
  end

  def strike_frame
    @total_score += 10 + @next_roll + @first_roll_next_frame
    @current_roll +=1
  end

  def spare_frame
    @total_score += 10 + @first_roll_next_frame
    @current_roll += 2
  end

  def regular_frame
    @total_score += @roll + @next_roll
    @current_roll +=2
  end

  def strike?
    @roll == 10
  end

  def spare?
    @roll + @next_roll == 10
  end

  def rolls?
    @current_roll < @rolls.size-1
  end

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
