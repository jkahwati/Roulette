# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


#set :RBENV_VERSION, "2.3.3"
set :environment, :development
set :output, "#{path}/log/cron_log.logs"
env :GEM_PATH, ENV['GEM_PATH']

env :PATH, ENV['PATH']


every 3.minutes do
	command "echo '________________________Empieza el Juego:_____________________________________________________________'"
	runner "Game.create()"
	command "echo '________________________Termina el juego_____________________________________________________________'"
	

	every 1.day do
		command "echo '________________________empieza el daily_bonus:_____________________________________________________________'"
		runner "Player.daily_bonus()"
		command "echo '________________________termina el daily_bonus_____________________________________________________________'"
	end
	

	every 1.hour do

		runner "Forecast.request()"
	end
	

end

