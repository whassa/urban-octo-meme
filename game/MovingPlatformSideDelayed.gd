extends Node2D

const IDLE_DURATION = 0

export var move_to = Vector2.RIGHT * 400
export var speed = 5.0

var follow = Vector2.ZERO

onready var platform = $Platform
onready var tween = $Tween

func _ready():
	_init_tween()
	

func _init_tween():
	var duration = move_to.length() / float(speed * 32)
	
	tween.interpolate_property(
		platform, 
		"position", 
		move_to,
		Vector2.ZERO, 
		duration, 
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN_OUT, 
		IDLE_DURATION
	)
	
	tween.interpolate_property(
		platform, 
		"position", 
		Vector2.ZERO, 
		move_to, 
		duration, 
		Tween.TRANS_LINEAR, 
		Tween.EASE_IN_OUT, 
		duration+IDLE_DURATION
	)
	
	tween.start()
	
func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow, 0.075)

