module Candle

  ##
  # This module it's used for bootstrap rake
  # thirdy party tasks
  #
  # ==== Examples
  #
  #   Candle::Tasks.files << yourtask.rb
  #   Candle::Tasks.files.concat(Dir["/path/to/all/my/tasks/*.rb"])
  #   Candle::Tasks.files.unshift("yourtask.rb")
  #
  module Tasks

    ##
    # Returns a list of files to handle with appjam rake
    #
    def self.files
      @files ||= Dir[File.dirname(__FILE__) + "/tasks/**/*.rb"]
    end
  end # Tasks
end # Candle