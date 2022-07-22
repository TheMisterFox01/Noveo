class Vector
    attr_reader :vector
    def initialize(vect)
        @vector = vect
    end  

    def add(vect)
        return nil unless equal_size?(vect)
        res = Vector.new(vector.dup)
        i = 0
        res.vector.each do |el|
            res.vector[i] = el + vect[i]
        end
        res
    end

    def [](index)
        vector.to_a[index]
    end

    def subtract(vect)
        return nil unless equal_size?(vect)
        res = Vector.new(vector.dup)
        i = 0
        res.vector.each do |el|
            res.vector[i] = el - vect[i]
        end
        res
    end

    def dot(vect)
        return nil unless equal_size?(vect)
        res = 0
        i = 0
        vector.each do |el|
            res += el * vect[i]
            i+=1
        end
        res
    end

    def norm
        res = 0
        vector.each { |el| res += el ** 2 }
        Math.sqrt(res)
    end

    def equal_size?(vect)
        vector.size == vect.vector.size
    end
end













class HashWithIndifferentAccess < Hash
    def [](key)
        key = key.is_a?(String) ? key.to_sym : key
        self.each do |hkey, hvalue|
            return hvalue if hkey == key
        end
        nil
    end
end

class Hash
    def with_indifferent_access
        HashWithIndifferentAccess[self]
    end
end
