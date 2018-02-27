# Place Input File at same level (where this rb file is located)
# Give file name on command prompt (e.g. ruby soccer-league.rb sample-input.txt)

class SoccerLeague
  # intializing instance
  def initialize
    # set file path using current location
    @file_path = File.expand_path(File.dirname(__FILE__)) + "/#{ARGV[0]}"
    @match_list = {}
  end

  def read_file
    File.open("#{@file_path}", 'r').each do |score|
      match_score = {}
      # read file add result in hash
      score.split(', ').each do |player|
        player_name = player.delete('0-9').strip 
        match_score[player_name] = player.scan(/\d/).join('').to_i
        @match_list[player_name] = 0 unless @match_list.has_key?(player_name)
      end
      calculate_score(match_score)
    end    
  end

  # Calculate points based on stored player name and score
  def calculate_score(match_score)
    if match_score.values[0] > match_score.values[1]
      @match_list[match_score.keys[0]] += 3
    elsif match_score.values[0] == match_score.values[1]
      @match_list[match_score.keys[0]] += 1
      @match_list[match_score.keys[1]] += 1
    end
  end

  # Print Output
  def display_score
    read_file
    rank = 1
    sorted_list = @match_list.sort_by{ |name, score| [-score, name] }
    sorted_list.each_with_index do |player, index|            
      if sorted_list[index-1][1] > sorted_list[index][1]
        rank = index + 1
      end
      p "#{rank}. #{player[0]}, #{player[1]} #{player[1] == 1 ? 'pt' : 'pts'}"
    end
  end
end

SoccerLeague.new.display_score
