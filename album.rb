require_relative 'track'

class Album
  attr_reader :id, :title, :artists
  attr_accessor :tracks
  def initialize(id, title, artists)
    @id = id
    @title = title
    @artists = artists
    @tracks = []
  end

  def duration_min
    mins = 0.0
    @tracks.each { |track| mins += track.duration_ms.to_f / (60.0 * 1000.0) }
    return mins
  end

  def summary
    summary = "Name: #{@title}\n"
    summary << "Artist(s): #{@artists}\n"
    summary << "Duration (min.): #{duration_min.round(2)}\n"
    summary << "Tracks:\n"
    @tracks.each { |track| summary << "- #{track.title}\n"}
    return summary
  end

end
