#!/usr/bin/ruby 

class Node
  attr_accessor :left, :right, :value
  
  def initialize(left = nil, right = nil, value)
	@value = value
	@left = left
	@right = right
  end
  
end

class BinaryTree
  attr_accessor :root
  
  def initialize
	@root = nil
  end
  
  def add(value, node = self.root)
	if node == nil
	  @root = Node.new(value)
	else
	  if node.value > value
		if node.left.nil?
		  node.left = Node.new(value)
		else
		  add(value,node.left)
		end
	  else
		if node.right.nil?
		  node.right = Node.new(value)
		else
		  add(value,node.right)
		end
	  end
	end  
  end

  def find_min(node = self.root)
	if node == nil
	  return nil
	elsif node.left == nil
	  return node
	end
	return find_min(node.left)  
  end
  
  def delete(value, node = self.root)
    if node == nil
	  return nil	
    elsif node.value > value
      node.left = delete(value, node.left)
    elsif node.value < value
      node.right = delete(value, node.right)
    else
      if !node.left.nil? && !node.right.nil?
        min = find_min(node.right)
        node.value = min.value
        node.right = delete(min.value, node.right)
      elsif !node.left.nil?
		if node == root
		  @root = node.left
		end
        node = node.left
      elsif !node.right.nil?
		if	node == root
		  @root = node.right
		end
        node = node.right
      else
        node = nil
      end
    end
	node
  end
  
  def find(value, node = self.root)
	if node == nil
      return nil
    elsif value < node.value
      return find(value, node.left)
    elsif value > node.value
      return find(value, node.right)
    else
      return node
    end
  end

  def to_s(node = self.root)
	if node.nil?
      return
    end
    puts node.value
    to_s(node.left)
    to_s(node.right)
  end 
end

tree = BinaryTree.new

tree.add(10) #=> 10
tree.add(20) #=> 20
tree.add(30) #=> 30

#p tree.root

tree.delete(10) #=> 10
tree.delete(25) #=> nil


p tree.find(20) #=> 20
p tree.find(26) #=> nil
