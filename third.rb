# Simple work with arrays

arr = []
arr2 = ["a","b","c"]
arr3 = ["a","b","c"]
numbers = [1,2,3,4,5,6]
arr_of_arrs = [arr,arr2,numbers]
p arr2 == arr3 #true 
p arr_of_arrs.assoc("a") #returns arr2
p arr3.length #3
numbers.each {|elem| p elem} #prints each number in array
p arr2.shift #returns and delete "a"

# Simple work with hash

h1 = {:a => 1, "second" => :symbol, :third => "str"}
tmp = {:a => 1, "second" => :symbol, :third => "str"}
p tmp #prints hash
p tmp.clear #clears hash
h1.default = "nothing here" #sets defaul value for non key calls
p h1["z"] #"nothing here"
h1.rehash #if keys are var. 
h2 = {:b => 2}
h1.replace(h2) #replace h2 with h1
p h1

# Simple work with range

r1 = (1..10)
r2 = ('a'..'z')
p r1.cover?("c") #false
p r2.cover?("c") #true 
p r1.bsearch {|elem| elem >= 5} 
p r2.include?("A") #false
p r2.include?("a") #true
p r1.min #1
p r2.size #nil
p r1.size #10

# Simple work with set

require 'set'
set = Set[1,2,2,3,4,5] # [1,2,3,4,5]
p set
p set.add?(1) #adds obj, if obj already ex returns nil
p set.delete?(2)
p set.divide {|i,j| (i-j).abs == 1} #devide set into [1] and [3,4,5]
p set.proper_subset? Set[1,2,3,4,5] #true if first is subset of second

# HomeWork

def str_to_hash(str)
    hash = Hash.new
    str.split.each do |elem|
        key, value = elem.split('=')
        hash[key.to_sym] = value.to_i
    end
end

p str_to_hash("a=1 b=2 c=3 d=4")

def ranks(arr)
    res = []
    buf = []
    for i in 0..arr.size-1
        buf[i] = arr[i]
        res[i] = arr[i]
    end
    tmp = 0
    tmp_i = 0
    for i in 0..arr.size-1
        if tmp == buf.max
            if tmp_i == 0
                tmp_i = i
            end
            res[buf.index(tmp)] = tmp_i
            buf[buf.index(tmp)] = 0
        else 
            tmp = buf.max
            res[buf.index(tmp)] = i+1
            buf[buf.index(tmp)] = 0
            tmp_i = 0
        end
    end
    return res
end

p ranks([3,3,3,3,3,5,1])
p ranks([9,3,6,10])