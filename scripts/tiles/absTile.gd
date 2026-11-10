@abstract 
class_name absTile extends Node2D

enum TILE_TYPES {
	outside=-1,
	land,
	water,
}

@export_group("Tile Data")
@export var tile_type: TILE_TYPES

@export var iconNode : Sprite2D

func setTileType(type:TILE_TYPES): 
	self.tile_type = type 

func _ready() -> void:
	# make sure that we have a child icon node
	assert(iconNode != null, "tile needs a sprite!")
	self.tile_type = TILE_TYPES.outside
