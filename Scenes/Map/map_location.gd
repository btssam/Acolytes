class_name MapLocation extends Control

@export_category("connections")
var _input_nodes : Array[MapLocation]
@export var _output_nodes : Array[MapLocation]

func getInputs() -> Array[MapLocation]:
	return _input_nodes
	
func addInput(loc : MapLocation): 
	_input_nodes.append(loc)

func getOutputs() -> Array[MapLocation]:
	return _output_nodes
