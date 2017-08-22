require 'spec_helper'

module TicTacToe
  RSpec.describe Cell do
    context "New cell creation" do
      it "initializes" do
        test_cell = Cell.new
        expect(test_cell.value).to eql("")
      end
      it "initializes with passed value" do
        test_cell = Cell.new "X"
        expect(test_cell.value).to eql "X"
      end
    end
  end
end