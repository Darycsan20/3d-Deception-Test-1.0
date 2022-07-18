extends Control

onready var healthBar : TextureProgress = get_node("healthBar")
onready var ammoText : Label = get_node("ammoText")
onready var scoreText : Label = get_node("scoreText")

func update_health_bar (curHp, maxHp):
	
	healthBar.max_value = maxHp
	healthBar.value = curHp
	pass

func update_ammo_text (ammo):
	
	ammoText.text = "Ammo: " + str(ammo)
	pass

func update_score_text (score):
	
	scoreText.text = "Score: " + str(score)
	pass
