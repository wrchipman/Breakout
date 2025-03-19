extends Node2D
var screen_size
var ball_scene = preload("res://ball.tscn")
var ball


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$Player.position = Vector2(screen_size.x/2, screen_size.y -30)
	ball_setup()
	$OutOfBounds.position = Vector2(0, screen_size.y + 250)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ball_setup():
	ball = ball_scene.instantiate()
	call_deferred("add_child", ball)
	ball.show()
	ball.position = Vector2(screen_size.x/2, screen_size.y - 200)


func _on_out_of_bounds_body_entered(_body):
	print("out of bounds")
	ball.queue_free()
	ball_setup()
