class Song

  attr_accessor :duration

  def initialize
    @lowest_duration = 60
    @highest_duration = 180

    @duration = (@lowest_duration..@highest_duration).to_a.sample
  end

  def orchestrate
    # outputs an mp3 file
  end

end
