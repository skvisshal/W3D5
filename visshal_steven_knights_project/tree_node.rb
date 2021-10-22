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

    def add_child(child_node)
        child_node.parent = self
    end 

    def remove_child(child_node)
        raise 'not a child' if !@children.include?(child_node)
        child_node.parent = nil
    end 

    def dfs(target_value)
        return self if @value == target_value

        @children.each do |child|
            node = child.dfs(target_value)
            return node if !node.nil? 
        end 
        nil 
    end 


    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            node = queue.shift
            return node if node.value == target_value
            queue += node.children
        end 
        nil
    end 

    def self.print(node)
        return if node.nil?
        p "#{node.parent} #{node.value} #{node.children}"
        puts 
        node.children.each do |child|
            PolyTreeNode.print(child)
        end 
        nil 
    end 

    
end