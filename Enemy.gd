extends KinematicBody


var health : int = 5
var moveSpeed : float = 1.0
# attacking
var damage : int = 1
var attackRate : float = 1.0
var attackDist : float = 2.0
var scoreToGive : int = 10
# components
onready var player : Node = get_node("/root/mundo/Player")
onready var timer : Timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(attackRate)
	timer.start()
	pass # Replace with function body.


func _physics_process(delta):
	
	# calculate the direction to the player
	var dir = (player.translation - translation).normalized()
	dir.y = 0
	
	# move the enemy towards the player
	if translation.distance_to(player.translation) > attackDist:
		move_and_slide(dir * moveSpeed, Vector3.UP)
	pass


func _on_Timer_timeout():
	if translation.distance_to(player.translation) <= attackDist:
		attack()
	pass # Replace with function body.



func take_damage (damage):
	health -= damage
	# if we've ran out of health - die
	if health <= 0:
		die()
pass

func die ():
	player.add_score(scoreToGive)
	queue_free()
	pass

func attack ():
	player.take_damage(damage)
	pass









