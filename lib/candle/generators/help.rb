require 'rubygems'
require 'cli-colorize'
require 'thor/group'
require 'hirb'

require File.dirname(__FILE__) + '/jam'

module Candle
  module Generators
    class Help < Jam
      include CLIColorize
      
      CLIColorize.default_color = :red
      RENDER_OPTIONS = { :fields => [:category,:command,:description] }   
            
      # Add this generator to our candle
      Candle::Generators.add_generator(:help, self)

      # Define the source root
      def self.source_root; File.expand_path(File.dirname(__FILE__)); end
      def self.banner; "candle help"; end

      # Include related modules
      include Thor::Actions
      include Candle::Generators::Actions            

      desc "Description:\n\n\tcandle help screen" 
      argument :name, :default => ""
      
      def create_help
        @developer = "eiffel"
        @created_on = Date.today.to_s
        puts colorize( "Candle Version: #{Candle::Version::STRING}", { :foreground => :red, :background => :white, :config => :underline } )
        puts
        puts "Candle is a wax iOS code generators tool."
        puts                    
        puts colorize("Generator Options")
        opt = [{ :category => "generators", :command => "candle blank demo", :description => "generate a blank wax iOS project"},
          { :category => "generators", :command => "candle xib demo", :description => "generate a wax iOS project using xib and core animation"},
          { :category => "generators", :command => "candle table demo", :description => "generate a wax blank iOS project using tableview"}
               ] 
        View.render(opt, RENDER_OPTIONS)
        puts        
      end

    end # Search
  end # Generators
end # Candle

