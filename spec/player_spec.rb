require 'spec_helper'

module TicTacToe  
  RSpec.describe Player do
    context "New player creation" do
      let :bob do
        bob = Player.new({:name => "Bob", :color => "X"})
      end

      it "throws error on initialize with empty Hash" do
        expect{ Player.new({}) }.to raise_error KeyError
      end

      it "returns a Player object with \:color and \:name attributes" do
        expect(bob).to be_a Player
        expect(bob.color).to eql("X")
        expect(bob.name).to eql("Bob")
      end
    end
  end
end