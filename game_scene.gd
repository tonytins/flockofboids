extends Node2D

@export var num := 100
@export var margin := 100
var screensize : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screensize = get_viewport_rect().size
	randomize()
	for i in num:
		spawn_boid()

func _on_timer_timeout() -> void:
	var c := $Boids.get_child_count()
	if c < num:
		for i in floor(num - c):
			spawn_boid()

func spawn_boid() -> void:
	var boid: Area2D = preload("res://boid.tscn").instantiate()
	$Boids.add_child(boid)
	boid.modulate = Color(randf(), randf(), randf(), 1)
	boid.global_position = Vector2((randf_range(margin, screensize.x - margin)), (randf_range(margin, screensize.x - margin)))
