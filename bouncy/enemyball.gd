extends Area2D

@export var ballspeed = 600
var screen_size
var velocity = Vector2(-1,-1)
@onready var player = %player
@onready var enemy = %enemy
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var audio_stream_player_2: AudioStreamPlayer = $AudsdioStreamPlayer2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * ballspeed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	
	#bounces the ball
	if (position.x <= 10) or (position.x >= screen_size.x-10):
		velocity.x*=-1 
		audio_stream_player.play()
	
	if (position.y <= 10) or (position.y >= screen_size.y-10):
		velocity.y*=-1
		audio_stream_player.play()
	

		
func _bounceX() -> void:
	if ((player.position.x < position.x) and (velocity.x < 0)) or (enemy.position.x < position.x) and (velocity.x < 0):
		velocity.x*=-1
	elif ((player.position.x > position.x) and (velocity.x > 0)) or ((enemy.position.x > position.x) and (velocity.x > 0)):
		velocity.x*=-1
	audio_stream_player.play()
	
func _bounceY() -> void:
	if ((player.position.y < position.y) and (velocity.y < 0)) or ((enemy.position.y < position.y) and (velocity.y < 0)):
		velocity.y*=-1
	elif ((player.position.y > position.y) and (velocity.y > 0)) or ((enemy.position.y > position.y) and (velocity.y > 0)):
		velocity.y*=-1
	audio_stream_player.play()

func _on_body_entered(body: Node2D) -> void:
	if ( abs(position.x - body.position.x) > abs(position.y - body.position.y)):
		_bounceX()
	else:
		_bounceY()
	
	if (body == player):
		player.health -= 1
		audio_stream_player_2.play()
