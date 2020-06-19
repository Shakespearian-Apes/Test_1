extends Node2D


var player
onready var gun = get_node_or_null("Player_Root").get_child(0).get_child(2)


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node_or_null("Player_Root").get_child(0)
	player.connect("picked_up", self, "delete_gun")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func delete_gun(weapon):
	for gun in $Guns.get_children():
		if gun.get_name() == weapon.get_name():
			gun.queue_free()
