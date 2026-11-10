@abstract 
class_name absCard extends Node2D

@export_category("Card Variables")
@export var card_name := ""
@export var card_cost := 0
@export var card_char := absChar.CHAR_ENUM.test_char

@abstract func card_function() -> void
