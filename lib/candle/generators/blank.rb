# encoding: utf-8
require 'rubygems'
require 'cli-colorize'
require 'hirb'
require File.dirname(__FILE__) + '/jam'
require File.dirname(__FILE__) + '/../view'

module Candle
  module Generators
    class Blank < Jam
      include CLIColorize
      
      CLIColorize.default_color = :red
      author 'Eiffel Qiu'
      homepage 'http://www.likenote.com'
      email 'eiffelqiu@gmail.com'
      version Candle::Version::STRING  

      # Add this generator to our candle
      Candle::Generators.add_generator(:blank, self)
  
      init_generator

      desc "Description:\n\n\tcandle will generates an new wax iOS application"

      argument :name, :desc => "The name of your wax application"

      class_option :root, :desc => "The root destination", :aliases => '-r', :default => ".", :type => :string
      class_option :destroy, :aliases => '-d', :default => false,   :type    => :boolean

      def create_project
        valid_constant?(options[:project] || name)
        @project_name = (options[:app] || name).gsub(/\W/, "_").downcase
        @class_name = (options[:app] || name).gsub(/\W/, "_").capitalize
        @developer = "#{`whoami`.strip}"
        @created_on = Date.today.to_s
        self.destination_root = options[:root]
        project = options[:project]
        self.behavior = :revoke if options[:destroy]
        
        puts colorize( "Candle Version: #{Candle::Version::STRING}", { :foreground => :red, :background => :white, :config => :underline } )
        puts        

        eval(File.read(__FILE__) =~ /^__END__\n/ && $' || '')       
        say (<<-TEXT).gsub(/ {10}/,'')
    
      =================================================================
      Your #{@project_name} wax application has been generated.
      Open #{@project_name}.xcodeproj
      Build and Run
      =================================================================
    
      TEXT
      end
    end # Project
  end # Generators
end # Candle

__END__
empty_directory "#{@project_name}"

directory "lua/scripts", "#{@project_name}/scripts"
directory "lua/wax", "#{@project_name}/wax"

directory "templates/blank/WaxApplication.xcodeproj", "#{@project_name}/#{@project_name}.xcodeproj"

fileName = "#{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.pbxproj"
aFile = File.open(fileName, "r")
aString = aFile.read
aFile.close
aString.gsub!('WaxApplication', "#{@project_name}")
File.open(fileName, "w") { |file| file << aString }

fileName = "#{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/xcuserdata/eiffel.xcuserdatad/xcschemes/WaxApplication.xcscheme"
aFile = File.open(fileName, "r")
aString = aFile.read
aFile.close
aString.gsub!('WaxApplication', "#{@project_name}")
File.open(fileName, "w") { |file| file << aString }

fileName = "#{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/xcuserdata/eiffel.xcuserdatad/xcschemes/xcschememanagement.plist"
aFile = File.open(fileName, "r")
aString = aFile.read
aFile.close
aString.gsub!('WaxApplication', "#{@project_name}")
File.open(fileName, "w") { |file| file << aString }

fileName = "#{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/xcuserdata/eiffel.xcuserdatad/xcschemes/WaxApplication.xcscheme"
aFile = File.open(fileName, "r")
aString = aFile.read
aFile.close
aString.gsub!('WaxApplication', "#{@project_name}")
File.open(fileName, "w") { |file| file << aString }

fileName = "#{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.xcworkspace/contents.xcworkspacedata"
aFile = File.open(fileName, "r")
aString = aFile.read
aFile.close
aString.gsub!('WaxApplication', "#{@project_name}")
File.open(fileName, "w") { |file| file << aString }

fileName = "#{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.xcworkspace/xcuserdata/eiffel.xcuserdatad/UserInterfaceState.xcuserstate"
aFile = File.open(fileName, "r")
aString = aFile.read.unpack("C*").pack("U*")
aFile.close
aString.gsub!('WaxApplication', "#{@project_name}")
File.open(fileName, "w") { |file| file << aString }

system "mv #{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.xcworkspace/xcuserdata/eiffel.xcuserdatad #{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.xcworkspace/xcuserdata/#{`whoami`.strip}.xcuserdatad" unless #{`whoami`.strip} != 'eiffel'

system "mv #{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/xcuserdata/eiffel.xcuserdatad #{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/xcuserdata/#{`whoami`.strip}.xcuserdatad" unless #{`whoami`.strip} != 'eiffel'

system "mv #{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.xcworkspace/xcuserdata/eiffel.xcuserdatad/UserInterfaceState.xcuserstate #{options[:root]}/#{@project_name}/#{@project_name}.xcodeproj/project.xcworkspace/xcuserdata/#{`whoami`.strip}.xcuserdatad/UserInterfaceState.xcuserstate"  unless #{`whoami`.strip} != 'eiffel'

template "templates/blank/WaxApplication/main.m.tt", "#{@project_name}/#{@project_name}/main.m"
template "templates/blank/WaxApplication/ProtocolLoader.h", "#{@project_name}/#{@project_name}/ProtocolLoader.h"

directory "templates/blank/WaxApplication/en.lproj", "#{@project_name}/#{@project_name}/en.lproj"
template "templates/blank/WaxApplication/Default.png", "#{@project_name}/#{@project_name}/Default.png"
template "templates/blank/WaxApplication/Default@2x.png", "#{@project_name}/#{@project_name}/Default@2x.png"
template "templates/blank/WaxApplication/Default-568h@2x.png", "#{@project_name}/#{@project_name}/Default-568h@2x.png"

template "templates/blank/WaxApplication/WaxApplication-Info.plist.tt", "#{@project_name}/#{@project_name}/#{@project_name}-Info.plist"
template "templates/blank/WaxApplication/WaxApplication-Prefix.pch.tt", "#{@project_name}/#{@project_name}/#{@project_name}-Prefix.pch"

system "chmod 777 #{@project_name}/wax/lib/build-scripts/*"
