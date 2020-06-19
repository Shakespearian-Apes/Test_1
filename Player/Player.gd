extends KinematicBody2D

#Gun Preloads
var rifle = preload("res://Guns/Rifle/Rifle.tscn")
var pistol = preload("res://Guns/Pistol/Pistol.tscn")

#Gun Pickup Vars
var pick_up = false
var picked_up = false
var weapon = null

signal picked_up(weapon)

func _ready():
	pass

func _process(delta):
	if pick_up == true && Input.is_action_just_pressed("ui_accept") && weapon != null:
		var gun
		if weapon.gun == 2:
			gun = pistol.instance()
		elif weapon.gun == 1:
			gun = rifle.instance()
		if picked_up == true:
			get_child(3).queue_free()
		add_child(gun)
		emit_signal("picked_up", weapon)
		if picked_up == false:
			picked_up = true

func _on_Gun_Pickup_area_entered(area):
	pick_up = true
	weapon = area.get_parent()


func _on_Gun_Pickup_area_exited(area):
	pick_up = false
	weapon = null
