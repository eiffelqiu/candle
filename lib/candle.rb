lib_dir = File.expand_path(File.join(File.dirname(__FILE__),'candle'))
unless $LOAD_PATH.include?(lib_dir)
  $LOAD_PATH << lib_dir
end

require 'thread'
require 'candle/version'
require 'candle/tasks'
require 'active_support' 

module Candle
  ##
  # This method return the correct location of mvc-gen bin or
  # exec it using Kernel#system with the given args
  #
  def self.bin_gen(*args)
    @_mvc_gen_bin ||= [IphoneMvc.ruby_command, File.expand_path("../bin/candle", __FILE__)]
    args.empty? ? @_mvc_gen_bin : system(args.unshift(@_mvc_gen_bin).join(" "))
  end

  ##
  # This module it's used for register generators
  #
  module Generators

    DEV_PATH = File.expand_path("../../", File.dirname(__FILE__))

    class << self

      ##
      # Here we store our generators paths
      #
      def load_paths
        @_files ||= []
      end

      ##
      # Return a ordered list of task with their class
      #
      def mappings
        @_mappings ||= ActiveSupport::OrderedHash.new
      end

      ##
      # Gloabl add a new generator class
      #
      def add_generator(name, klass)
        mappings[name] = klass
      end
      
      ##
      # Load Global Actions and Component Actions then all files in +load_path+.
      #
      def load_components!
        require 'candle/generators/actions'
        load_paths.flatten.each { |file| require file  }
      end      
    end
  end # Generators
end # Candle

##
# We add our generators to Candle::Genererator
#
Candle::Generators.load_paths << Dir[File.dirname(__FILE__) + '/candle/generators/{blank,help}.rb']



