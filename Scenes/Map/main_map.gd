extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	## GraphEdit Test
	#for child : Control in $GraphEdit.get_children(): 
		#if child is GraphNode:
			#(child as GraphNode).selectable = false;
			
	 ## our own implementation
	print("making lines")
	var children : Array[Node] = $MapParent.get_children()
	for child : MapLocation in children:
		for next in child.getOutputs(): 
			var line : Line2D = child.get_child(1)
			line.add_point(child.position)
			line.add_point(next.position)
			print(child.name)
			print(next.name)
			print(line.points)
			
	print("lines done!")
			
