extends Node2D
var screen_size
var ball_scene = preload("res://Scenes/ball.tscn")
var block_scene = preload("res://Scenes/blocks.tscn")
var ball
var max_lives = 3
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$Player.position = Vector2(screen_size.x/2, screen_size.y -30)
	ball_setup()
	$OutOfBounds.position = Vector2(0, screen_size.y + 250)
	
	add_blocks(60)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func ball_setup():
	ball = ball_scene.instantiate()
	call_deferred("add_child", ball)
	ball.show()
	ball.position = Vector2(screen_size.x/2, screen_size.y - 200)
	
func add_blocks(blocks):
	var j = 0
	var k = 0
	for i in range(blocks):
		k = i % 12 
		if i % 12 == 0:
			j += 30

		var block = block_scene.instantiate()
		call_deferred("add_child", block)
		#print(block.get_children()[0].texture.get_size())
		block.connect("broken", on_broken_block)

		block.position = Vector2(70 + k * 100, 100 + j)
		
		
		

func on_broken_block():
	score += 1
	print(score)
	
func _on_out_of_bounds_body_entered(_body):
	print("out of bounds")
	ball.queue_free()
	max_lives -= 1
	if max_lives == 0:
		end_game()
	else:
		ball_setup()

func end_game():
	pass
	
