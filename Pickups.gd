extends Area

enum PickupType {
	Health,
	Ammo
}

export(PickupType) var type = PickupType.Health
export var amount : int = 10
# bobbing
onready var startYPos : float = translation.y
var bobHeight : float = 1.0
var bobSpeed : float = 1.0
var bobbingUp : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process (delta):
	# move us up or down
	translation.y += (bobSpeed if bobbingUp else -bobSpeed) * delta
	# if we're at the top, start moving downwards
	if bobbingUp and translation.y > startYPos + bobHeight:
		bobbingUp = false
	# if we're at the bottom, start moving up
	elif !bobbingUp and translation.y < startYPos:
		bobbingUp = true
	pass



func pickup (player):
	if type == PickupType.Health:
		player.add_health(amount)
	elif type == PickupType.Ammo:
		player.add_ammo(amount)


func _on_Pickups_body_entered(body):
	if body.name == "Player":
		pickup(body)
		queue_free()
	pass
	pass # Replace with function body.
