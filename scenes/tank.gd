extends Node2D

var fish_scene: PackedScene = load("res://scenes/animated_fish.tscn")

var rng := RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_fish(level: int) -> void:

	var fish = fish_scene.instantiate()
	fish.scale *= level
	fish.position = Vector2(randi_range(0,1920),randi_range(0,1080))
	$fishes.add_child(fish)


func _on_timer_timeout() -> void:
	var i : int = rng.randi_range(1,5)
	spawn_fish(i)
	
