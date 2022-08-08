#!/usr/bin/ruby

module CapitalizeEachWord
  def capitalize_each_word
    self.split.map {|elem| elem.capitalize}.join(' ')
  end
end

class String
  include CapitalizeEachWord
end

str1 = 'string one'
str2 = 'string two'

p str1.capitalize_each_word # "String One"
p str2.capitalize_each_word # "String Two"