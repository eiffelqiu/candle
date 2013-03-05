module Candle
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 1
    
    STRING = [MAJOR, MINOR, PATCH].compact.join('.').chomp('.')
  end
end