require 'rubygems'
require 'thor/group'
require 'cli-colorize'
require 'hirb'

module Candle
  module Generators
    ##
    # This class bootstrap +config/boot+ and perform +Candle::Generators.load_components!+ for handle
    # 3rd party generators
    #
    class Cli < Thor::Group
      include CLIColorize
      
      CLIColorize.default_color = :red
      
      RENDER_OPTIONS = { :fields => [:category,:command,:description] }   
      # Include related modules
      include Thor::Actions
      desc "Candle Version:\t#{Candle::Version::STRING}"
      class_option :help, :desc => "Help screen", :aliases => '-h', :type => :string
      
      # We need to TRY to load boot because some of our app dependencies maybe have
      # custom generators, so is necessary know who are.
      def load_boot
        begin
          ENV['BUNDLE_GEMFILE'] = File.join(options[:root], "Gemfile") if options[:root]
        rescue Exception => e
          puts "=> Problem loading #{boot}"
          puts ["=> #{e.message}", *e.backtrace].join("\n  ")
        end
      end

      def setup
        Candle::Generators.load_components!

        generator_kind  = ARGV.delete_at(0).to_s.downcase.to_sym if ARGV[0].present?
        generator_class = Candle::Generators.mappings[generator_kind]
        if generator_class
          args = ARGV.empty? && generator_class.require_arguments? ? ["-h"] : ARGV  
          generator_class.start(args)            
        else                 
          puts colorize( "222Candle Version: #{Candle::Version::STRING}", { :foreground => :red, :background => :white, :config => :underline } )
          puts     
        end
      end
    end # Cli
  end # Generators
end # Candle