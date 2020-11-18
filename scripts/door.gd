extends Area2D

var tile_position

func open_door():
    get_parent().set_cellv(tile_position, 4)