class_name MapScene extends Node2D

@export 
var starting_node : MapLocation
var current_location : MapLocation

func _ready() -> void:
	var children : Array[Node] = $MapParent.get_children()
	for child : MapLocation in children:
		for next in child.output_nodes: 
			# add input node into array
			next.addInput(child)
			# add lines
			var line : Line2D = Line2D.new()
			# center of TextureButton 
			line.position = Vector2(32, 32) 
			line.default_color = Color(0.14, 0.14, 0.14, 1.0)
			line.add_point(Vector2(0,0))
			line.add_point(next.position - child.position)
			child.add_child(line)
			child.move_child(line, 0)
		child.pressed.connect(_node_entered)
		child.state = MapLocation.states.DISABLED
		
	starting_node.state = MapLocation.states.ENABLED
	current_location = starting_node
	
func _node_entered(node : MapLocation): 
	for input in node.input_nodes:
		input.state = MapLocation.states.DISABLED
		for sibling in input.output_nodes:
			sibling.state = MapLocation.states.DISABLED
	node.state = MapLocation.states.SELECTED
	for output in node.output_nodes: 
		output.state = MapLocation.states.ENABLED
		
		 
	
