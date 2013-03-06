module Candle
  module Version
    VERSIONSTRING = File.read(File.join(File.dirname(__FILE__),'/../../VERSION'))
    MAJOR, MINOR, PATCH = VERSIONSTRING.split('.')
    STRING = [MAJOR, MINOR, PATCH].compact.join('.').chomp('.')
  end
end