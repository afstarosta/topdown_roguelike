extends KinematicBody2D

const low_speed = 50
const medium_speed = 100
const high_speed = 150

func _ready():
    pass

func _physics_process(delta: float):
    var direction = get_input_direction()
    var momentum = direction * delta * decide_speed()
    move_according_to_momentum(momentum)
    
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
    if Input.is_action_just_pressed("ui_crouch"):
        return low_speed
        
    return medium_speed

func move_according_to_momentum(momentum: Vector2):
    move_and_collide(momentum)