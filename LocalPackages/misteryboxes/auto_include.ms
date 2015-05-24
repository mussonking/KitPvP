#=========================================================================#
#
# Command Helper auto_include.ms second file for Kit PVP - Mystery Boxes -
#
#=========================================================================#

### VOTER TEASER BOX ###
proc(_loadonstartmysteryboxes,
	export('mystery.list.small',
	array(
	###chainmail armor###
	1: array(item: 302, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	2: array(item: 303, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	3: array(item: 304, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	4: array(item: 305, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	###stone swords###
	5: array(item: 272, enchants: array(array(elevel: '1', etype: 'DAMAGE_ALL'))),
	6: array(item: 272, enchants: array(array(elevel: '2', etype: 'DAMAGE_ALL'))),
	7: array(item: 272, enchants: array(array(elevel: '3', etype: 'DAMAGE_ALL'))),
	###stone axe###
	8: array(item: 275, enchants: array(array(elevel: '1', etype: 'DAMAGE_ALL'))),
	9: array(item: 275, enchants: array(array(elevel: '2', etype: 'DAMAGE_ALL'))),
	10: array(item: 275, enchants: array(array(elevel: '3', etype: 'DAMAGE_ALL'))),
	###Iron armor###
	11: array(item: 306),
	12: array(item: 307),
	13: array(item: 308),
	14: array(item: 309),
	)
	)
	## Chance to get items
	@smallbox = array(1: 6, 2: 6, 3: 6, 4: 6, 5: 9, 6: 6, 7: 3, 8: 9, 9: 6, 10: 3, 11: 6, 12: 6, 13: 6, 14: 6)
	@arraykeys = array_keys(@smallbox)
	@arraynormal = array_normalize(@smallbox)
	@arraysize = array_size(@smallbox)
	@finalarray = array()
		for(@i = 0, @i < @arraysize , @i++,
			@makeys = array_get(@arraynormal, @i)
			for(@y = 0, @y < @makeys , @y++,
			array_push(@finalarray, array_get(@arraykeys, @i))
				)
			)
		export('small.mystery.box', @finalarray)
	)

### Super TEASER BOX ###
proc(_loadonstartsuperboxes,
	export('mystery.list.super',
	array(
	###iron armor###
	15: array(item: 306, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	16: array(item: 307, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	17: array(item: 308, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	18: array(item: 309, enchants: array(array(elevel: '1', etype: 'PROTECTION_ENVIRONMENTAL'))),
	###iron swords###
	19: array(item: 267, enchants: array(array(elevel: '2', etype: 'DAMAGE_ALL'))),
	###bow###
	20: array(item: 261, enchants: array(array(elevel: '1', etype: 'ARROW_DAMAGE'))),
	)
	)	
	@smallbox = array(15: 10, 16: 10, 17: 10, 18: 10, 19: 10, 20: 10)
	@arraykeys = array_keys(@smallbox)
	@arraynormal = array_normalize(@smallbox)
	@arraysize = array_size(@smallbox)
	@finalarray = array()
		for(@i = 0, @i < @arraysize , @i++,
			@makeys = array_get(@arraynormal, @i)
			for(@y = 0, @y < @makeys , @y++,
			array_push(@finalarray, array_get(@arraykeys, @i))
				)
			)
		export('super.mystery.box', @finalarray)
	)
	
### Epic TEASER BOX ###
proc(_loadonstartepicboxes,
	export('mystery.list.epic',
	array(
	###iron armor###
	21: array(item: 306, enchants: array(array(elevel: '2', etype: 'PROTECTION_ENVIRONMENTAL'))),
	22: array(item: 307, enchants: array(array(elevel: '2', etype: 'PROTECTION_ENVIRONMENTAL'))),
	23: array(item: 308, enchants: array(array(elevel: '2', etype: 'PROTECTION_ENVIRONMENTAL'))),
	24: array(item: 309, enchants: array(array(elevel: '2', etype: 'PROTECTION_ENVIRONMENTAL'))),
	###iron swords###
	25: array(item: 267, enchants: array(array(elevel: '3', etype: 'DAMAGE_ALL'))),
	###bow###
	26: array(item: 261, enchants: array(array(elevel: '2', etype: 'ARROW_DAMAGE'))),
	)
	)	
	@smallbox = array(21: 8, 22: 8, 23: 8, 24: 8, 25: 8, 26: 8)
	@arraykeys = array_keys(@smallbox)
	@arraynormal = array_normalize(@smallbox)
	@arraysize = array_size(@smallbox)
	@finalarray = array()
		for(@i = 0, @i < @arraysize , @i++,
			@makeys = array_get(@arraynormal, @i)
			for(@y = 0, @y < @makeys , @y++,
			array_push(@finalarray, array_get(@arraykeys, @i))
				)
			)
		export('epic.mystery.box', @finalarray)
	)

	
###VOTE PERCENTAGE CHANCE###
proc(_luckyvoteloadup,
	@smallbox = array(80: 54, 15: 146, 5: 130)
	@arraykeys = array_keys(@smallbox)
	@arraynormal = array_normalize(@smallbox)
	@arraysize = array_size(@smallbox)
	@finalarray = array()
		for(@i = 0, @i < @arraysize , @i++,
			@makeys = array_get(@arraykeys, @i)
			for(@y = 0, @y < @makeys , @y++,
			array_push(@finalarray, array_get(@arraynormal, @i))
				)
			)
		export('luckyvote.percentage', @finalarray)
	)		

proc(_voteritemdraw, @player, @itemid,
	ptake_item(@player, @itemid, '1')
	_luckyvote(@player)
	)
	
	
	
	proc(_luckyvote, @player,
	@luckyvotelist = import('luckyvote.percentage')
	@luckyvote = array_rand(@luckyvotelist, 1, false)[0]
	if(@luckyvote == '54') {
		tmsg(@player, colorize('&5You received a Teaser box as voting Reward'))
		pgive_item(@player, 54, '1', array(display: 'Teaser Chest'))
	}
	if(@luckyvote == '146') {
		pgive_item(@player, 146, '1', array(display: 'Super Teaser Chest'))
		broadcast(colorize('&5'@player'was extremely lucky and got a Super Teaser box as voting Reward!!'))
	}
	if(@luckyvote == '130') {
		pgive_item(@player, 130, '1', array(display: 'Epic Teaser Chest'))
		broadcast(colorize('&5'@player'was extremely lucky and got an Epic Teaser box as voting Reward!!'))
	}
	)
	
	
proc(_smallmysterybox, @player, @itemid,
	@mysteryboxlist = import('small.mystery.box')
	@choosennumber = array_rand(@mysteryboxlist, 1, false)[0]
	@mysteryitemlist = import('mystery.list.small')
	@mysterybox = array_get(@mysteryitemlist, @choosennumber)
	@pgiveitemid = array_get(@mysterybox, item)
	if(array_index_exists(@mysterybox, 'enchants')) {
		@pgiveenchant = array_get(@mysterybox, 'enchants')
		 pgive_item(@player, @pgiveitemid, '1', array(enchants: @pgiveenchant))
		 ptake_item(@player, @itemid, '1')
		 die()
	}
	pgive_item(@player, @pgiveitemid, '1')
	ptake_item(@player, @itemid, '1')
	)
proc(_supermysterybox, @player, @itemid,
	@mysteryboxlist = array_merge(import('super.mystery.box'), import('small.mystery.box'))
	@choosennumber = array_rand(@mysteryboxlist, 1, false)[0]
	@mysteryitemlist = array_merge(import('mystery.list.small'), import('mystery.list.super'))
	@mysterybox = array_get(@mysteryitemlist, @choosennumber)
	@pgiveitemid = array_get(@mysterybox, item)
	if(array_index_exists(@mysterybox, 'enchants')) {
		@pgiveenchant = array_get(@mysterybox, 'enchants')
		 pgive_item(@player, @pgiveitemid, '1', array(enchants: @pgiveenchant))
		 ptake_item(@player, @itemid, '1')
		 die()
	}
	pgive_item(@player, @pgiveitemid, '1')
	ptake_item(@player, @itemid, '1')
	)
proc(_epicmysterybox, @player, @itemid,
	@mysteryboxlist = array_merge(import('super.mystery.box'), import('epic.mystery.box'))
	@choosennumber = array_rand(@mysteryboxlist, 1, false)[0]
	@mysteryitemlist = array_merge(import('mystery.list.epic'), import('mystery.list.super'))
	@mysterybox = array_get(@mysteryitemlist, @choosennumber)
	@pgiveitemid = array_get(@mysterybox, item)
	if(array_index_exists(@mysterybox, 'enchants')) {
		@pgiveenchant = array_get(@mysterybox, 'enchants')
		 pgive_item(@player, @pgiveitemid, '1', array(enchants: @pgiveenchant))
		 ptake_item(@player, @itemid, '1')
		 die()
	}
	pgive_item(@player, @pgiveitemid, '1')
	ptake_item(@player, @itemid, '1')
	)