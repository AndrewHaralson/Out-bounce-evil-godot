extends CharacterBody2D

@export var speed = 400
var screen_size
var health = 3
@onready var gamemanager = $"../gamemanager"
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	
	var velocity = Vector2.ZERO # The player's movement vector.
	
	var collision = move_and_collide(velocity * delta)
	
	if (collision) and (timer.is_stopped()):
		health-=1
		audio_stream_player.play()
		timer.start()
	
	if (health > 0):
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	
