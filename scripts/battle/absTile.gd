@abstract 
class_name absTile extends Node2D

enum TILE_TYPES {
	outside=-1,
	land,
	water,
}

@export_group("Tile Data")
@export var tile_type: TILE_TYPES

func setTileType(type:TILE_TYPES): 
	var iconNode : Sprite2D = get_node_or_null("./icon")
	if iconNode == null: 
		iconNode = Sprite2D.new()
		var image := Image.load_from_file("res://Assets/icon.svg")
		var texture := ImageTexture.create_from_image(image)
		iconNode.texture = texture
		iconNode.apply_scale(Vector2(0.125, 0.125))
		var color := Color(1.0, 0.18, 1.0, 1.0)
		iconNode.modulate = color
		self.add_child(iconNode)
			
	
	self.tile_type = type 

func _ready() -> void:
	self.tile_type = TILE_TYPES.outside
