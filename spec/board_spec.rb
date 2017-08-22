require 'spec_helper'

module TicTacToe
  RSpec.describe Board do
    context "New board creation" do
      let :board do
        board = Board.new
      end

      it "initializes with a valid custom input Hash" do
        expect{ board2 = Board.new({:grid=>"grid"}) }.not_to raise_error
      end

      it "initializes with a default grid if no input Hash is provided" do
        expect(board.inspect).not_to eql(nil)
      end

      it "has a :grid attribute and getter method" do
        expect(board.grid).not_to eql(nil)
      end

      it "default board has 3 columns" do
        board.grid.each do |column|
          expect(column).to be_a(Array)
        end
      end

      it "default board has 3 rows" do
        board.grid.each do |column|
          column.each do |row|
            expect(row).to be_a Cell
          end
        end
      end

      context "#get_cell" do
        it "get_cell returns the value inside of a grid" do
          grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
          board = Board.new(grid: grid)
          expect(board.get_cell(2, 1)).to eq "something"
        end
      end

      context "#set_cell" do
        it "updates the value of the cell object at a (x, y) coordinate" do
          Cat = Struct.new(:value)
          grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
          board = Board.new(grid: grid)
          board.set_cell(0, 0, "meow")
          expect(board.get_cell(0, 0).value).to eq "meow"
        end
      end

      context "#game_over" do
        let :board do
          board = Board.new
        end

        it "returns :winner if winner? is true" do
          allow(board).to receive(:winner?) { true }
          expect(board.game_over).to eq :winner
        end
       
        it "returns :draw if winner? is false and draw? is true" do
          allow(board).to receive(:winner?) { false }
          allow(board).to receive(:draw?) { true }
          expect(board.game_over).to eq :draw
        end
       
        it "returns false if winner? is false and draw? is false" do
          allow(board).to receive(:winner?) { false }
          allow(board).to receive(:draw?) { false }
          expect(board.game_over).to be(false)
        end
      end
    end
  end
end