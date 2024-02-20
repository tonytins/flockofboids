extends Area2D

@onready var rayFolder := $RayFolder.get_children()
var boidsISee := []
var vel: Vector2 = Vector2.ZERO
var speed := 7.0
var screensize: Vector2
var movv := 48

func _ready():
	screensize = get_viewport_rect().size
	randomize()
	
func _physics_process(delta):
	# boids()
	# check_collision()
	vel = vel.normalized() * speed
	# move()
	
func boids():
	if boidsISee:
		var numOfBoids := boidsISee.size()
		var avgVel := Vector2.ZERO
		var avgPos := Vector2.ZERO
		var steerAway := Vector2.ZERO
		for boid in boidsISee:
			avgVel += boid.vel
			avgPos += boid.position

func check_collision():
	pass

# Boilerplate taken from example code
func move():
	global_position += vel
	if global_position.x < 0:
		global_position.x = screensize.x 
	if global_position.x > screensize.x:
		global_position.x = 0
	if global_position.y < 0:
		global_position.y = screensize.y 
	if global_position.y > screensize.y:
		global_position.y = 0


func _on_vision_area_entered(area: Area2D):
	if area != self and area.is_in_group("boid"):
		boidsISee.append(area)


func _on_vision_area_exited(area: Area2D):
	if area:
		boidsISee.erase(area)
