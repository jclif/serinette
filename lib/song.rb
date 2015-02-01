class Song

  attr_accessor :duration, :tracks

  def initialize
    setDuration
    setTracks
  end

  def orchestrate
    # outputs an mp3 file
  end

  private

  def setDuration
    @lowest_duration = 60
    @highest_duration = 180

    @duration = (@lowest_duration..@highest_duration).to_a.sample
  end

  def setTracks
    @tracks = [Track.new]
  end

end
