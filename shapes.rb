#!/usr/bin/ruby

class ShapesInterface
  def get_square
  end
end

class Square < ShapesInterface
  attr_reader :length

  def initialize(length)
	@length = length
  end

  def get_square
	length*length
  end
end

class Rectangle < ShapesInterface 
  attr_reader :length, :width

  def initialize(length, width)
	@length = length
	@width = width
  end

  def get_square
	length*width
  end
end

class Triangle < ShapesInterface
  attr_reader :base, :height

  def initialize(base, height)
	@base = base
	@height = height
  end

  def get_square
	0.5*base*height
  end
end

class Circle < ShapesInterface
  attr_reader :radius

  def initialize(radius)
	@radius = radius
  end

  def get_square
	radius*Math::PI*radius
  end
end

class CustomShape < ShapesInterface
  attr_reader :square

  def initialize(square)
	@square = square
  end

  def get_square
	square
  end
end	

class Array
  def sort
	arr = []
	self.each { |elem| arr = arr + [elem] }
	for i in 0..(arr.size-1)
	  for j in 0..(arr.size-i-2)
		if arr[j+1].get_square < arr[j].get_square
		  arr[j], arr[j+1] = arr[j+1], arr[j]
		end
	  end
	end
	arr
  rescue NoMethodError
	super	
  end
end

test = [3,4,1,2]
puts shapes = [Square.new(5), Rectangle.new(3,4), Triangle.new(5,2), Circle.new(2), CustomShape.new(10)]
shapes.each { |elem| puts elem.get_square }
puts arr = shapes.sort
arr.each { |elem| puts elem.get_square }
puts test.sort