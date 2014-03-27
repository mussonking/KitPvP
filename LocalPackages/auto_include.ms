proc(_loadonstartarrays,
	### How much money you receive after a kill
	export('kill.amount', '5')
	
	##########################################
	# Add your kit name into the right array
	##########################################
	### Kit that can be bought, add the price!
	@buylist = array(3500: knight, 5000: legend, 8000: pro)
	### permission based kits (even vip & vip+)
	@permlist = array('fight', 'soldier', 'archer', 'vip', 'vip+')
	
	##########################################
	# Do NOT modify this part
	##########################################
	### start ###
	@normpermlist = array_normalize(@buylist)
	@fulllist = array_merge(@permlist, @normpermlist)
	export('kit.perm.list', @permlist)
	export('kit.buy.list', @buylist)
	export('kit.list', @fulllist)
	### end ###
	
	##########################################
	#Add each kit using this format: export('kit.id.<kitname>', array(ItemID, Qty, EnchantType, EnchantLevel))
	#enchant-type: p = protection po = power s = sharpness
	#Dont forget to add your kit in the right list, Buy kit(whit price) or by Permission kit
	##########################################
	export('kit.id.fight', array(array(306, 1), array(307, 1), array(308, 1), array(309, 1), array(272, 1, s, 1)))
	export('kit.id.soldier', array(array(302, 1, p, 1), array(303, 1, p, 1), array(304, 1, p, 1), array(305, 1, p, 1), array(275, 1, s, 1), array('373:16421', 10)))
	export('kit.id.archer', array(array(298, 1, p, 1), array(299, 1, p, 1), array(300, 1, p, 1), array(301, 1, p, 1), array(261, 1, po, 1), array(262, 128), array('373:16421', 7)))
	export('kit.id.knight', array(array(314, 1, p, 2), array(315, 1, p, 2), array(316, 1, p, 2), array(317, 1, p, 2), array('373:16421', 10), array(272, 1, s, 2)))
	export('kit.id.legend', array(array(310, 1), array(311, 1), array(312, 1), array(313, 1), array('373:16421', 10), array(267, 1, s, 3)))
	export('kit.id.pro', array(array(310, 1, p, 4), array(311, 1, p, 4), array(312, 1, p, 4), array(313, 1, p, 4), array('322:1', 2), array(276, 1, s, 1)))
	export('kit.id.vip', array(array(302, 1, p, 2), array(303, 1, p, 2), array(304, 1, p, 2), array(305, 1, p, 2), array('322:0', 5), array('373:16421', 7), array('373:8201', 1), array(261, 1, po, 1), array(258, 1, s, 2), array(262, 64)))
    export('kit.id.vip+', array(array(306, 1, p, 3), array(307, 1, p, 3), array(308, 1, p, 3), array(309, 1, p, 3), array('322:0', 10), array('373:16421', 7), array('373:8201', 1), array(261, 1, po, 2), array(262, 64), array(267, 1, s, 2), array('373:8201', 1), array('322:1', 1)))
)
	##########################################
	#Add each kit Timer Cooldown 
	##########################################
	proc(_kit_cooldown, @ident,
		if(@ident == 'fight') {
			return('86400000')
		}
		if(@ident == 'soldier') {
			return('60000')
		}
		if(@ident == 'archer') {
			return('90000')
		}
		if(@ident == 'knight') {
			return('300000')
		}
		if(@ident == 'legend') {
			return('18000000')
		}		
		if(@ident == 'pro') {
			return('432000000')
		}

		if(@ident == 'vip') {
			return('7200000')
		}
		if(@ident == 'vip+') {
			return('18000000')
		}
	)
	
	
