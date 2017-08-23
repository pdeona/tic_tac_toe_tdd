require 'spec_helper'

module TicTacToe
  RSpec.describe Game do
    let (:bob) { Player.new({color: "X", name: "bob"}) }
    let (:frank) { Player.new({color: "O", name: "frank"}) }
    let (:game) do
      player_array = [frank, bob]
      game = Game.new(player_array)
    end
 
    context "#initialize" do
      it "randomly selects a current_player" do
        expect(game.current_player.name).not_to be("")
      end
 
      it "randomly selects an other_player" do
        expect(game.other_player.name).not_to be("")
      end
    end

    context "#switch_players" do
      it "will set @current_player to @other_player" do
        game.switch_players
        expect(game.current_player.name).not_to eq game.other_player.name
      end

      it "will set @other_player to @current_player" do
        game.switch_players
        expect(game.other_player.name).not_to eq game.current_player.name
      end
    end

    context "#solicit_move" do
      it "asks the player to make a move" do
        game = Game.new([bob, frank])
        expected = "#{game.current_player.name}: Enter a number between 1 and 9 to make your move"
        expect(game.solicit_move).to eq expected
      end
    end
    
    context "#get_move" do
      it "converts human_move of '1' to [0, 0]" do
        game = Game.new([bob, frank])
        expect(game.get_move("1")).to eq [0, 0]
      end
     
      it "converts human_move of '7' to [0, 2]" do
        game = Game.new([bob, frank])
        expect(game.get_move("7")).to eq [0, 2]
      end
    end

    context "#game_over_message" do
      it "returns '{current player name} won!' if board shows a winner" do
        game = Game.new([bob, frank])
        allow(game.board).to receive(:game_over) { :winner }
        expect(game.game_over_message).to eq "#{game.current_player.name} won!"
      end
     
      it "returns 'The game ended in a tie' if board shows a draw" do
        game = Game.new([bob, frank])
        allow(game.board).to receive(:game_over) { :draw }
        expect(game.game_over_message).to eq "The game ended in a tie"
      end
    end
  end
end