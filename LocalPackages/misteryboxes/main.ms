#=========================================================================#
#
# Command Helper main.ms second file for Kit PVP - Mystery Boxes
#
#=========================================================================#
###Timer to load random arrays for Mystery Crates###
set_timeout(2000, closure(
	_loadonstartmysteryboxes()
	_loadonstartsuperboxes()
	_loadonstartepicboxes()
	_luckyvoteloadup()
	))



bind(inventory_click, null, null, @event,
	@itemid = @event['slotitem']
	@player = @event['player']
	@slottype = @event['slottype']
	if(!is_array(@itemid)) {
		die()
	}
	@itemid = array_get(@itemid, type)
###Mystery crate #1, smallest crate, chest -> ID -> 54 ####
	if(@itemid == '54') {
	if(@slottype != 'QUICKBAR') {
		die(colorize('&4Error: Please put your Teaser Box in the QuickBar to open it'))
	}
		_smallmysterybox(@player, @itemid)
	}
###Mystery crate #2, Super crate, trapped chest -> ID -> 146 ####
	if(@itemid == '146') {
	if(@slottype != 'QUICKBAR') {
		die(colorize('&4Error: Please put your Teaser Box in the QuickBar to open it'))
	}
		_supermysterybox(@player, @itemid)
	}
###Mystery crate #3, epic crate, EnderChest -> ID -> 130 ####
	if(@itemid == '130') {
	if(@slottype != 'QUICKBAR') {
		die(colorize('&4Error: Please put your Teaser Box in the QuickBar to open it'))
	}
		_epicmysterybox(@player, @itemid)
	}
###Voter item to active luckyvotedraw ###
	if(@itemid == '5') {
	if(@slottype != 'QUICKBAR') {
		die(colorize('&4Error: Please put your Teaser Box in the QuickBar to open it'))
	}
		_voteritemdraw(@player, @itemid)
	}
)
	
	
	
