proc(_loadonstartarrays,
    ### How much money you receive after a kill
    export('kill.amount', '4')
    
    ##########################################
    # Add your kit name into the right array
    ##########################################
    ### Kit that can be bought, add the price!
    @buylist = array(300: scout, 600: general, 1200: sniper, 2000: sergeant, 4000: lieutenant)
    ### permission based kits (even vip & vip+)
    @permlist = array('recruit', 'private', 'corporal', 'vip', 'vipplus', 'vipplusplus')
    
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
    #Dont forget to add your kit in the right list, Buy kit(with price) or by Permission kit                  
    ##########################################
    ### Default Kits ###
    export('kit.id.recruit', array(60000, array(272, 1), array(261, 1, i, 1), array(302, 1), array(303, 1), array(304, 1), array(305, 1), array('373:8197', 1), array(262, 1))) #Done
    export('kit.id.private', array(300000, array(272, 1, s, 1), array(261, 1, i, 1), array(302, 1, p, 1), array(303, 1), array(304, 1), array(305, 1, p, 1), array('373:8229', 1), array(262, 1))) #Done
    export('kit.id.corporal', array(600000, array(272, 1, s, 3), array(261, 1, po, 1), array(306, 1), array(303, 1, p, 1), array(308, 1), array(309, 1), array('373:8229', 2), array(262, 64))) #Done
    ### Buyable Kits ###
    export('kit.id.scout', array(900000, array(268, 1, s, 3), array(306, 1), array(303, 1, p, 1), array(304, 1, p, 1), array(309, 1), array('373:8226', 1), array('373:8229', 2))) #Done
	export('kit.id.general', array(1200000, array(275, 1 , s, 3), array(280, 1, kb, 2), array(306, 1), array(303, 1, p, 1), array(308, 1), array(309, 1), array('373:8229';, 3))) #Done
    export('kit.id.sniper', array(2400000, array(261, 1, po, 1, i, 1), array('373:8206', 2), array(368, 2), array(305, 1, ff, 2), array(262, 1))) #Done
    export('kit.id.sergeant', array(3600000, array(267, 1, s, 2), array(302, 1, p, 1), array(307, 1), array(308, 1), array(309, 1), array('373:8225', 1), array('373:16421', 1), array('373:8229', 2))) #Done
    ### Donator kits ###
    export('kit.id.lieutenant', array(28800000, array(267, 1, s, 3), array(306, 1, p, 1), array(307, 1, p, 1), array(308, 1, p, 1), array(309, 1, p, 1), array(322, 5), array('373:16421', 1), array('373:8229', 2))) #Done
    export('kit.id.vip', array(43200000, array(267, 1, s , 2), array(261, 1, po, 2), array(306, 1, p, 1), array(307, 1), array(308, 1), array(309, 1, p, 1), array('373:16421', 2), array('373:8229', 3), array(262, 64))) #Done
    export('kit.id.vipplus', array(43200000, array(267, 1, s, 3), array(261, 1, po, 2, i, 1), array(306, 1), array(307, 1, p, 1), array(308, 1, p, 1), array(309, 1), array('373:16421', 3), array('373:8229', 3), array(262, 1))) #Done
    export('kit.id.vipplusplus', array(350000, array(272, 1, s, 2), array(261, 1, i, 1), array(302, 1, p, 1), array(303, 1, p, 1), array(304, 1, p, 1), array(305, 1, p, 1), array('373:8229', 2), array(262, 1))) #Done & Needs To Be Added To Perms List 
)

proc(_kit_cooldown, @ident,
    @return = array_get(import('kit.id.'.@ident), 0)
        return(@return)
)
    
