extends Area2D

var tile_position
var open = false

func open_door():
    if(!open):
        var  v = get_parent().get_cellv(tile_position)
        get_parent().set_cellv(tile_position, v + 1)
        open = true