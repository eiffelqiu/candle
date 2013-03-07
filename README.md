candle
======
![candle](http://eiffelqiu.github.com/candle/images/candle.png)
Candle is a rubygem for wax iOS framework which writes iOS application in lua. 

Prerequisites
=======
Ruby
-------
Candle require ruby installed on your mac machine. Since now all Mac OSX system preinstalled ruby enviroment, that's not a big issue. 

Rubygem(latest)
-------
Candle has an dependency on "thor" gem , which require latest rubygem installed, so you need to update your rubygem to latest version, run command below to update your rubygem to the latest one.

	$ sudo gem update --system  # double dash option

Installation
=======
	$ sudo gem install candle

Usage
=======
Usage 1: candle help
-------
	$ candle help

![candle usage](http://eiffelqiu.github.com/candle/images/candle1.png)

Usage 2: generate a blank wax iOS project
-------
	$ candle blank demo
	$ cd demo
	$ open demo.xcodeproj	

![candle usage](http://eiffelqiu.github.com/candle/images/candle2.png)

![candle usage](http://eiffelqiu.github.com/candle/images/candle3.png)

Xcode build and run

Usage 3: generate a wax iOS project using xib and core animation
-------
	$ candle xib demo
	$ cd demo
	$ open demo.xcodeproj	

![candle usage](http://eiffelqiu.github.com/candle/images/candle4.png)

![candle usage](http://eiffelqiu.github.com/candle/images/candle5.png)

Xcode build and run

Usage 4: generate a wax blank iOS project using tableview
-------
	$ candle table demo
	$ cd demo
	$ open demo.xcodeproj	

![candle usage](http://eiffelqiu.github.com/candle/images/candle6.png)

![candle usage](http://eiffelqiu.github.com/candle/images/candle7.png)

Xcode build and run

Contributing to candle
=======
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=======
Copyright (c) 2011 Eiffel Q. See LICENSE.txt for
further details.
