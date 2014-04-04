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
proc(_killstreak, @player, @number,
	if(array_size(all_players()) > 7) {
		if(@number == '3') {
			broadcast(colorize('&a'.@player'&bIs on &4Killing Spree'))
			pgive_item(@player, '373:8229', '1')
		}
		if(@number == '5') {
			broadcast(colorize('&a'.@player'&bIs on &4Rampage'))
			pgive_item(@player, '373:8229', '1')
		}
		if(@number == '10') {
			broadcast(colorize('&a'.@player'&bIs &4Unstoppable'))
			pgive_item(@player, '373:16421', '5')
		}
		if(@number == '15') {
			broadcast(colorize('&a'.@player'&bIs &4Dominating'))
			pgive_item(@player, '322', '5')
		}
		if(@number == '25') {
			broadcast(colorize('&a'.@player'&bIs &4GodLike'))
			pgive_item(@player, '322:1', '2')
		}
		if(@number == '50') {
			broadcast(colorize('&a'.@player'&bIs &4Legendary!!!'))
			pgive_item(@player, '322:1', '5')
			pgive_item(@player, '264', '64')
		}
		
	}
)

proc(_diestreak, @player,
	@killstreak = import('kill.streak.number.'.@player)
		if(@killstreak != null) {
			if(@killstreak >= '50') {
				acc_add(@player, '30')
				tmsg(@player,colorize('&2You have been awarned $7 for killing a &4Legend'))
				die()
			}
			if(@killstreak >= '25') {
				acc_add(@player, '10')
				tmsg(@player,colorize('&2You have been awarned $10 for killing a &4GodLike'))
				die()
			}
			if(@killstreak >= '15') {
				acc_add(@player, '4')
				tmsg(@player,colorize('&2You have been awarned $4 for killing a &4Dominator'))
				die()
			}
			if(@killstreak >= '10') {
				acc_add(@player, '3')
				tmsg(@player,colorize('&2You have been awarned $3 for killing an &4Unstoppable'))
				die()
			}
			if(@killstreak >= '5') {
				acc_add(@player, '2')
				tmsg(@player,colorize('&2You have been awarned $2 for stoping his &4Rampage'))
				die()
			}
			if(@killstreak >= '3') {
				acc_add(@player, '2')
				tmsg(@player,colorize('&2You have been awarned $2 for stoping his &4Killing Spree'))
				die()
			}
		}
)
	
	
