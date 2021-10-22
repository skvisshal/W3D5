require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :root_node

    def self.valid_moves(pos)
        valid_positions = []
        start_row = pos[0]
        start_col = pos[1]
        valid_positions << [start_row + 2, start_col + 1] if (start_row + 2).between?(0,7) && (start_col + 1).between?(0,7)
        valid_positions << [start_row + 2, start_col - 1] if (start_row + 2).between?(0,7) && (start_col - 1).between?(0,7)
        valid_positions << [start_row - 2, start_col + 1] if (start_row - 2).between?(0,7) && (start_col + 1).between?(0,7)
        valid_positions << [start_row - 2, start_col - 1] if (start_row - 2).between?(0,7) && (start_col - 1).between?(0,7)
        valid_positions << [start_row + 1, start_col + 2] if (start_row + 1).between?(0,7) && (start_col + 2).between?(0,7)
        valid_positions << [start_row + 1, start_col - 2] if (start_row + 1).between?(0,7) && (start_col - 2).between?(0,7)
        valid_positions << [start_row - 1, start_col + 2] if (start_row - 1).between?(0,7) && (start_col + 2).between?(0,7)
        valid_positions << [start_row - 1, start_col - 2] if (start_row - 1).between?(0,7) && (start_col - 2).between?(0,7)
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


    def build_move_tree
       nodes_queue = [@root_node]
       while !nodes_queue.empty?
            first_node =  nodes_queue.shift
            moves_arr =  new_move_positions(first_node.value)
            moves_arr.each do |child_position|
                child_node = PolyTreeNode.new(child_position)
                @root_node.add_child(child_node)
                nodes_queue << child_node
            end 
       end
       p @considered_positions.length 
    end 



end

knight = KnightPathFinder.new([5,5])
knight.build_move_tree
# PolyTreeNode.print(knight.root_node)
