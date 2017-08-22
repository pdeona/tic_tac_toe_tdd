require 'spec_helper'

module TicTacToe
  RSpec.describe Game do
    let (:bob) { Player.new({color: "X", name: "bob"}) }
    let (:frank) { Player.new({color: "O", name: "frank"}) }
    let (:game) do
      player_array = Array.new.<<(frank).<<(bob)
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
        expect(game.current_player.name).to eq other_player.name
      end
     
      it "will set @other_player to @current_player" do
        game.switch_players
        expect(game.other_player).to eq current_player.name
      end
    end
  end
end
test