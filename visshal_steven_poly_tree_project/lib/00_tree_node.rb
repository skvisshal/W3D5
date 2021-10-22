class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        @parent.children.delete(self) if !@parent.nil?
        @parent = node
        node.children << self if !node.nil? && !node.children.include?(self)
    end

    
end