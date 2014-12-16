proc(_loadonstartarrays,
	### How much money you receive after a kill
	export('kill.amount', '4')
	
	##########################################
	# Add your kit name into the right array
	##########################################
	### Kit that can be bought, add the price!
	@buylist = array(250: scout, 400: assault, 600: general, 1000: assassin, 1600: king, 2400: lord, 6000: pro)
	### permission based kits (even vip & vip+)
	@permlist = array('runner', 'soldier', 'archer', 'vip', 'vipplus', 'legend', 'knight')
	
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
	#enchant-type: p = protection po = power s = sharpness  kb = knockback   akb = Punch   i = infinity 
	#Dont forget to add your kit in the right list, Buy kit(whit price) or by Permission kit
	##########################################
	### Default Kits ###
	export('kit.id.soldier', array(5000, array(298, 1), array(299, 1), array(300, 1), array(301, 1), array(268, 1)))
	export('kit.id.runner', array(300000, array(315, 1, th, 1), array(280, 1, kb, 2), array('373:8194', 1)))
	export('kit.id.archer', array(180000, array(314, 1), array(315, 1), array(316, 1), array(317, 1), array(261, 1, i, 1), array(262, 1), array('373:8197', 1)))
	export('kit.id.knight', array(300000, array(302, 1, p, 1), array(315, 1, p, 1), array(316, 1, p, 2), array(305, 1), array('373:8197', 1), array(272, 1)))
	export('kit.id.legend', array(3600000, array(306, 1), array(303, 1, p, 1), array(308, 1, p, 1), array(309, 1), array('373:8229', 2), array(272, 1, s, 3)))
	### Buyable Kits ###
	export('kit.id.scout', array(600000, array(306, 1), array(299, 1, p, 1), array(300, 1, p, 1), array(309, 1), array(268, 1, s, 2), array('373:8229', 1)))
	export('kit.id.assault', array(1200000, array(302, 1, p, 1), array(307, 1), array(300, 1, p, 1), array(305, 1, p, 1), array(272, 1, s, 1), array('373:8229', 2), array(332, 16)))
	export('kit.id.general', array(600000, array(306, 1), array(303, 1), array(304, 1, p, 1), array(309, 1, p, 1), array(271, 1, s, 4), array('373:8229', 1)))	
	export('kit.id.assassin', array(3600000, array(298, 1), array(299, 1, p, 2), array(300, 1), array(301, 1), array(272, 1, s, 2), array(368, 2), array('373:8206', 2)))
	export('kit.id.king', array(3600000, array(305, 1, p, 2), array(302, 1, p, 1), array(303, 1, p, 2), array(304, 1, p, 2), array(280, 1, s, 4), array('373:8229', 1)))
	export('kit.id.lord', array(18000000, array(306, 1), array(303, 1, p, 1), array(304, 1, p, 1), array(305, 1, p, 1), array(267, 1, s, 2), array('373:8229', 3), array('373:8225', 1), array('322', 2)))
	### Donator kits ###
	export('kit.id.pro', array(86400000, array(306, 1, p, 1), array(307, 1, p, 1), array(308, 1, p, 1), array(309, 1, p, 2), array('322', 5), array(267, 1, s, 2)))
	export('kit.id.vip', array(21600000, array(306, 1), array(307, 1), array(308, 1), array(309, 1), array(267, 1), array(322, 1), array('373:8229', 2), array('373:8193', 2), array(261, 1, po, 1), array(262, 64)))
    export('kit.id.vipplus', array(36000000, array(306, 1, p, 1), array(307, 1), array(308, 1), array(309, 1, p, 1), array('373:8229', 3), array(261, 1, po, 2), array(262, 64), array(267, 1), array('373:8225', 2)))
)

proc(_kit_cooldown, @ident,
	@return = array_get(import('kit.id.'.@ident), 0)
		return(@return)
)
	
