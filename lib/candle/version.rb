module Candle
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 4
    
    STRING = [MAJOR, MINOR, PATCH].compact.join('.').chomp('.')
  end
end