require_relative 'config/environment.rb'

# pid = fork{ exec 'afplay', "./The Office Theme Song.mp3" }
#pid = fork{ exec 'killall', "afplay"}


cli = Cli.new
cli.start

#binding.pry
0