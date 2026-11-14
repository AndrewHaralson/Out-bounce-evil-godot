extends CharacterBody2D

@export var enemyspeed = 100
var screen_size
@onready var player = %player
var health = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var velocity = Vector2(0,0)
	
	var xdifference = player.position.x - position.x
	var ydifference = player.position.y - position.y

	velocity = Vector2(xdifference,ydifference)
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * enemyspeed
	
	
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
