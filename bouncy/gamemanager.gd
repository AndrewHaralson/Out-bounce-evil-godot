extends Node

@onready var label: Label = %Label
@onready var player: CharacterBody2D = %player
@onready var enemy: CharacterBody2D = $"../enemy"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if (player.health<=0):
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.text = "GAME OVER!!!! \nEvil Godot killed you"
		get_tree().paused = true
	elif (enemy.health<=0):
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		label.text = "YOU WIN!!!!! \nYou defeated evil Godot"
		get_tree().paused = true

	else:
		label.text = "Health: " + str(player.health) + "  Enemy: " + str(enemy.health)
