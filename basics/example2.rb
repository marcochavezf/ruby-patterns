#!/usr/bin/env ruby

def m(x)
  
  if block_given? 
    5.times do
       yield x
    end
  end
  
end

m(4) { |n| puts n }
