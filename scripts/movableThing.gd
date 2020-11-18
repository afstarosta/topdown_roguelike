extends KinematicBody2D

const low_speed = 50
const medium_speed = 100
const high_speed = 150

var interactable_area

var collided_object

func _ready():
    interactable_area = get_node("interactableArea")
    pass

func _physics_process(delta: float):
    var direction = get_input_direction()
    var momentum = direction * delta * decide_speed()
    move_according_to_momentum(momentum)
    interact()
    
func get_input_direction():
    var velocity = Vector2()
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    if velocity.length() > 0:
        velocity = velocity.normalized()
    return velocity
    
func decide_speed():
    if Input.is_action_pressed("ui_sprint"):
        return high_speed
    if Input.is_action_pressed("ui_crouch"):
        return low_speed
        
    return medium_speed

func move_according_to_momentum(momentum: Vector2):
    collided_object = move_and_collide(momentum)
    
func interact():
    if Input.is_action_just_pressed("ui_accept"):
        var areas = interactable_area.get_overlapping_areas()
        for area in areas:
            if(area.is_in_group('door')):
                area.open_door()
            
        