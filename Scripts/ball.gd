extends RigidBody2D

var speed = 350
var movement = Vector2(50, -speed)


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
			
			var old_vel = sqrt(movement.x**2 + movement.y**2)
			var y_prime = sqrt(abs(old_vel**2 - (diff*5)**2))
			if diff > 100 or diff < -100:
				pass
			else:	
				diff = 100
			var new_movement = Vector2(-diff * 5  , y_prime * (movement.y/abs(movement.y)))
			movement = new_movement
			
		
		if collision_info.get_collider().is_in_group("blocks"):
			collision_info.get_collider().queue_free()
			movement *= 1.05
			if abs(movement.y) > 800:
				movement.y = 800 * movement.y/abs(movement.y)
		
		

		
