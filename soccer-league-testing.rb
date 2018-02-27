require 'minitest/spec'
require 'minitest/autorun'
require_relative 'soccer-league'

class Testing
  describe SoccerLeague do
    describe 'final score' do
      it 'Checking Get total points method' do
        result = SoccerLeague.new.read_file('sample-input.txt')
        assert_equal(result, { 'Tarantulas' => 6, 'Lions' => 5, 'FC Awesome' => 1, 'Snakes' => 1, 'Grouches' => 0 })
      end
    end

    describe 'display score' do
      it 'It will display score' do
        assert_output("\"1. Tarantulas, 6 pts\"\n\"2. Lions, 5 pts\"\n\"3. FC Awesome, 1 pt\"\n\"3. Snakes, 1 pt\"\n\"5. Grouches, 0 pts\"\n") { SoccerLeague.new.display_score }
      end
    end
  end
end
