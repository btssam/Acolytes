class_name MapLocation extends Control

enum states {ENABLED, DISABLED, SELECTED}  
signal pressed 
var input_nodes : Array[MapLocation]

@export_group("Node Connections")
@export var output_nodes : Array[MapLocation]
@export var state := states.ENABLED:
	set(new_state):
		if(new_state == states.ENABLED): 
			$TextureButton.modulate = enabled_color
			$TextureButton.disabled = false
		if(new_state == states.DISABLED): 
			$TextureButton.modulate = disabled_color
			$TextureButton.disabled = true
		if(new_state == states.SELECTED): 
			$TextureButton.modulate = selected_color

@export_group("Node Colors")
@export var enabled_color := Color(1.0, 1.0, 1.0, 1.0)
@export var disabled_color := Color(0.43712, 0.43712, 0.43712, 1)
@export var selected_color := Color(0.768, 0.001, 0.781, 1.0)

func getInputs() -> Array[MapLocation]:
	return input_nodes
	
func addInput(loc : MapLocation): 
	input_nodes.append(loc)

func _on_texture_button_pressed() -> void:
	if(state == states.DISABLED): pass
	elif(state == states.ENABLED): pressed.emit(self)
	elif(state == states.SELECTED): pass
	else: pass
