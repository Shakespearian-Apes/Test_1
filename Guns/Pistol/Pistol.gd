extends Position2D


var mouse_postion


func _ready():
	pass

func _process(delta):
	mouse_postion = get_local_mouse_position()
	rotation += mouse_postion.angle()
	var degree = rad2deg(get_global_rotation())
	if degree < -90:
		$Sprite.set_scale(Vector2(1,-1))
	elif degree > 90:
		$Sprite.set_scale(Vector2(1,-1))
	else:
		$Sprite.set_scale(Vector2(1,1))
	shoot()

func shoot():
	if Input.is_action_just_pressed("fire"):
		$Sprite/Particles2D.emitting = true
		$AnimationPlayer.play("Kickback")

