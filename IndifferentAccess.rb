#!/usr/bin/ruby

module IndifferentAccessable
  def [](key)
	if key.is_a?(String) || key.is_a?(Symbol)
	  if self.include? key.to_s
  	    super(key.to_s)
	  elsif self.include? key.to_sym
	    super(key.to_sym)
      end
	else 
	  super(key)
	end  
  end
end

class Hash
  def make_indifferent_accessable!
	self.singleton_class.prepend IndifferentAccessable
	self
  end
end

hash1 = { a: 1, 'b' => 2, 1 => 3 }.make_indifferent_accessable! # можно вызвать метод так

puts hash1['a'] #=> 1
puts hash1[:b] #=> 2
puts hash1[1] #=> 3

hash2 = { d: 3, true => 'True' }
puts hash2.make_indifferent_accessable!['d'] # можно и так, сразу обращаться по ключу
puts hash2[true] #=> True