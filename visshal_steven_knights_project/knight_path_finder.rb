require_relative "tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        valid_positions = []
        start_row = pos[0]
        start_col = pos[1]
        valid_positions << [start_row + 2, start_col + 1]
        valid_positions << [start_row + 2, start_col - 1]
        valid_positions << [start_row - 2, start_col + 1]
        valid_positions << [start_row - 2, start_col - 1]
        valid_positions << [start_row + 1, start_col + 2]
        valid_positions << [start_row + 1, start_col - 2]
        valid_positions << [start_row - 1, start_col + 2]
        valid_positions << [start_row - 1, start_col - 2]
        valid_positions
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        valid_positions = KnightPathFinder.valid_moves(pos)
        non_repeated = []
        valid_positions.each do |position|
            non_repeated << position if !@considered_positions.include?(position)
        end
        @considered_positions += non_repeated
        non_repeated
    end


end