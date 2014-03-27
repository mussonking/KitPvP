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
	_emptyinv(@died)
	@amount = import('kill.amount')
	acc_add(@killer, @amount)
	export('kit.used.'.@died, '')
		if(ponline(@killer)) {
			tmsg(@killer, colorize('&2 You have been awarned'@amount'for killing'@died))
		}
	tmsg(@died, colorize('&c You have been killed by'@killer))
)

bind(item_drop, null, null, @event,
	cancel()
	)
	