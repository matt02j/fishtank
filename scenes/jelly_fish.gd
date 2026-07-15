extends Node2D

var rng := RandomNumberGenerator.new()
var velocity:Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(rng.randi_range(-100,100),rng.randi_range(-100,100))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * delta
	if velocity.x > 0 :
		$AnimatedSprite2D.flip_h = true
	else :
		$AnimatedSprite2D.flip_h = false


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("border"):
		velocity = Vector2(velocity[0]*-1, velocity[1]*-1)
	else:
		velocity = Vector2(rng.randi_range(-100,100),rng.randi_range(-100,100))
