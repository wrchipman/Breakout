extends RigidBody2D

var speed = 300
var movement = Vector2(0, speed)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision_info = move_and_collide(movement * delta)

	if collision_info:
		movement = movement.bounce(collision_info.get_normal())
		if collision_info.get_collider().name == "Player":
			var diff = collision_info.get_collider().position.x - position.x
			var new_movement = Vector2(-diff * 5 , movement.y)
			movement = new_movement
		
		if collision_info.get_collider().is_in_group("blocks"):
			collision_info.get_collider().queue_free()
			apply_impulse(movement)
		

		
