#=========================================================================#
#
# Command Helper main file for Kit PVP
#
#=========================================================================#
set_timeout(1000, closure(
	_loadonstartarrays()
	))
bind(player_death, null, null, @event,
	@died = @event['player']
	@killer = @event['killer']
	@amount = import('kill.amount')
		if(ponline(@killer)) {
			acc_add(@killer, @amount)
			tmsg(@killer, colorize('&2 You have been awarned'@amount'for killing'@died))
			@killstreak = import('kill.streak.number'.@killer)
				if(!is_numeric(@killstreak)) {
					@killstreak = '0'
				}
				@killstreak++
				export('kill.streak.number'.@killer, @killstreak)
				_killstreak(@killer, @killstreak)
		}
	tmsg(@died, colorize('&c You have been killed by'@killer))
	export('kill.streak.number.'.@died, null)
	_diestreak(@died, @killer) #there is die() in that procedure
)
	