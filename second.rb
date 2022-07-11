def First(n)
  res = 0
  for i in 0..n 
    res = res && i.to_s(2)
  end
  return res
end

def Second(str)
  res = ''
  str.chars.each do |elem|
    if elem == '#'
      res = res[0..-2]
    else
      res << elem
    end
  end
  res
end
