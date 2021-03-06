extends TileMap

onready var door_node = load("res://scenes/door.tscn")

func _ready():
    place_door_nodes(0)
    place_door_nodes(2)

func place_door_nodes(id):
    var doors = get_used_cells_by_id(id)
    for door in doors:
        var door_position = map_to_world(door)
        var door_node_instance = door_node.instance()
        door_node_instance.position = Vector2(door_position.x + 16, door_position.y + 16)
        door_node_instance.tile_position = door
        add_child(door_node_instance)