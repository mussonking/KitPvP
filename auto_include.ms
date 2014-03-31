#=========================================================================#
#
# Command Helper auto_include file for Kit PVP
#
#=========================================================================#

proc(_emptyinv, @player,

	@empty = array(
				null, null, null, null, null, null, null, null, null, null, 
				null, null, null, null, null, null, null, null, null, null,
				null, null, null, null, null, null, null, null, null, null,
				null, null, null, null, null, 100:null, 101:null, 102:null, 103:null
			)

	if(@player == '',
		return(@empty),
		set_pinv(@player, @empty)
		return(true)
	)
	)
	
proc(_buykit, @player, @kitname, @price,
	if(!has_permission(@player, 'kit.'.@kitname)) {
		if(acc_balance(@player) >= @price) {
			sudo('/permissions player'@player'set kit.'.@kitname)
			acc_subtract(@player, @price)
			tmsg(@player, colorize('&5CONGRATULATION! &2 You have bought'@kitname' Kit!'))
			die()
		}
		die(colorize('&4Error: You do not have enough money to buy that Kit'))
	}
	die(colorize('&4Error: You already Own that Kit!'))
	)
	
proc(_identify_enchant, @ident,
		if(@ident == 'p') {
			return('PROTECTION_ENVIRONMENTAL')
		}
		if(@ident == 'po') {
			return('ARROW_DAMAGE')
		}
		if(@ident == 's') {
			return('DAMAGE_ALL')
		}
	)
proc(_identify_enchant_info, @ident,
		if(@ident == 'p') {
			return('Protection')
		}
		if(@ident == 'po') {
			return('Power')
		}
		if(@ident == 's') {
			return('Sharpness')
		}
	)
	
	
