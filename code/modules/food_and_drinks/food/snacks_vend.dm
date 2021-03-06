////////////////////////////////////////////SNACKS FROM VENDING MACHINES////////////////////////////////////////////
//in other words: junk food
//don't even bother looking for recipes for these

/obj/item/reagent_containers/food/snacks/candy
	name = "candy"
	desc = "Nougat love it or hate it."
	icon_state = "candy"
	trash = /obj/item/trash/candy
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	junkiness = 25
	filling_color = "#D2691E"
	tastes = list("конфета" = 1)
	foodtype = JUNKFOOD | SUGAR
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/candy/bronx
	name = "South Bronx Paradise bar"
	desc = "Lose weight, guaranteed! Caramel Mocha Flavor. Something about product consumption..."
	icon_state = "bronx"
	inhand_icon_state = "candy"
	trash = /obj/item/trash/candy
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 2, /datum/reagent/yuck = 1)
	junkiness = 10
	bitesize = 10
	filling_color = "#e4d4b7"
	tastes = list("конфета" = 5, "потеря веса" = 4, "личинка насекомых" = 1)
	foodtype = JUNKFOOD | RAW | GROSS
	custom_price = 800
	var/revelation = FALSE
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/candy/bronx/On_Consume(mob/living/eater)
	. = ..()
	if(ishuman(eater))
		var/mob/living/carbon/human/carl = eater
		var/datum/disease/P = new /datum/disease/parasite()
		carl.ForceContractDisease(P, FALSE, TRUE)

/obj/item/reagent_containers/food/snacks/candy/bronx/examine(mob/user)
	. = ..()
	if(revelation == FALSE)
		to_chat(user, "<span class='notice'>Geeze, you need to get to get your eyes checked. You should look again...</span>")
		desc = "Lose weight, guaranteed! Caramel Mocha Flavor! WARNING: PRODUCT NOT FIT FOR HUMAN CONSUMPTION. CONTAINS LIVE DIAMPHIDIA SPECIMENS."
		name = "South Bronx Parasite bar"
		revelation = TRUE

/obj/item/reagent_containers/food/snacks/sosjerky
	name = "\improper Scaredy's Private Reserve Beef Jerky"
	icon_state = "sosjerky"
	desc = "Beef jerky made from the finest space cows."
	trash = /obj/item/trash/sosjerky
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sodiumchloride = 2)
	junkiness = 25
	filling_color = "#8B0000"
	tastes = list("сушеное мясо" = 1)
	foodtype = JUNKFOOD | MEAT | SUGAR
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/sosjerky/healthy
	name = "homemade beef jerky"
	desc = "Homemade beef jerky made from the finest space cows."
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	junkiness = 0
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/chips
	name = "chips"
	desc = "Commander Riker's What-The-Crisps."
	icon_state = "chips"
	trash = /obj/item/trash/chips
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3, /datum/reagent/consumable/sodiumchloride = 1)
	junkiness = 20
	filling_color = "#FFD700"
	tastes = list("соль" = 1, "чипсы" = 1)
	foodtype = JUNKFOOD | FRIED
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/chips/Crossed(atom/movable/AM, oldloc)
	. = ..()
	if(!isliving(AM) || bitecount) // can't pop opened chips
		return

	var/mob/living/popper = AM
	if(popper.mob_size < MOB_SIZE_HUMAN)
		return

	playsound(src, 'sound/effects/chipbagpop.ogg', 100)
	popper.visible_message("<span class='danger'>[popper] steps on \the [src], popping the bag!</span>", "<span class='danger'>You step on \the [src], popping the bag!</span>", "<span class='danger'>You hear a sharp crack!</span>", COMBAT_MESSAGE_RANGE)
	generate_trash(loc)
	qdel(src)

/obj/item/reagent_containers/food/snacks/no_raisin
	name = "4no raisins"
	icon_state = "4no_raisins"
	desc = "Best raisins in the universe. Not sure why."
	trash = /obj/item/trash/raisins
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 4)
	junkiness = 25
	filling_color = "#8B0000"
	tastes = list("сушеный изюм" = 1)
	foodtype = JUNKFOOD | FRUIT | SUGAR
	custom_price = 90
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/no_raisin/healthy
	name = "homemade raisins"
	desc = "Homemade raisins, the best in all of spess."
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 2)
	junkiness = 0
	foodtype = FRUIT
	value = FOOD_RARE

/obj/item/reagent_containers/food/snacks/spacetwinkie
	name = "space twinkie"
	icon_state = "space_twinkie"
	desc = "Guaranteed to survive longer than you will."
	list_reagents = list(/datum/reagent/consumable/sugar = 4)
	junkiness = 25
	filling_color = "#FFD700"
	foodtype = JUNKFOOD | GRAIN | SUGAR
	custom_price = 30
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/candy_trash
	name = "candy cigarette butt"
	icon = 'icons/obj/clothing/masks.dmi'
	icon_state = "candybum"
	desc = "The leftover from a smoked-out candy cigarette. Can be eaten!"
	list_reagents = list(/datum/reagent/consumable/sugar = 4, /datum/reagent/ash = 3)
	junkiness = 10 //powergame trash food by buying candy cigs in bulk and eating them when they extinguish
	filling_color = "#FFFFFF"
	foodtype = JUNKFOOD | SUGAR
	value = FOOD_WORTHLESS

/obj/item/reagent_containers/food/snacks/candy_trash/nicotine
	desc = "The leftover from a smoked-out candy cigarette. Smells like nicotine..?"
	list_reagents = list(/datum/reagent/consumable/sugar = 4, /datum/reagent/ash = 3, /datum/reagent/drug/nicotine = 1)

/obj/item/reagent_containers/food/snacks/cheesiehonkers
	name = "cheesie honkers"
	desc = "Bite sized cheesie snacks that will honk all over your mouth."
	icon_state = "cheesie_honkers"
	trash = /obj/item/trash/cheesie
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/sugar = 3)
	junkiness = 25
	filling_color = "#FFD700"
	tastes = list("сыр" = 5, "чипсы" = 2)
	foodtype = JUNKFOOD | DAIRY | SUGAR
	custom_price = 45
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/syndicake
	name = "syndi-cakes"
	icon_state = "syndi_cakes"
	desc = "An extremely moist snack cake that tastes just as good after being nuked."
	trash = /obj/item/trash/syndi_cakes
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/doctor_delight = 5)
	filling_color = "#F5F5DC"
	tastes = list("сладость" = 3, "торт" = 1)
	foodtype = GRAIN | FRUIT | VEGETABLES
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/energybar
	name = "High-power energy bars"
	icon_state = "energybar"
	desc = "An energy bar with a lot of punch, you probably shouldn't eat this if you're not an Ethereal."
	trash = /obj/item/trash/energybar
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/liquidelectricity = 3)
	filling_color = "#97ee63"
	tastes = list("электричество" = 3, "фитнес" = 2)
	foodtype = TOXIC
	value = FOOD_JUNK
