extends Node

func calculate_hit_chance(attacker : Character, defender : Character) -> int:
	return attacker.stats.accuracy - defender.stats.evasion
	
func calculate_damage_dealt(attacker : Character, defender : Character, damage_type : Globals.DAMAGE_TYPE) -> int:
	match damage_type:
		Globals.DAMAGE_TYPE.PHYSICAL:
			return attacker.stats.strength - defender.stats.defense
		Globals.DAMAGE_TYPE.MAGICAL:
			return attacker.stats.magic - defender.stats.resistance
		Globals.DAMAGE_TYPE.TRUE:
			return 0
	return 0
