require_relative 'config/environment.rb'

# pid = fork{ exec 'afplay', "./The Office Theme Song.mp3" }
#pid = fork{ exec 'killall', "afplay"}

pid = fork{exec 'afplay', "Indiana Jones Theme Song [HD].mp3"}

cli = Cli.new
cli.start

#binding.pry
0