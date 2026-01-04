extends CharacterBody2D
class_name Player

# Stats
@export_group("Stats")
@export var max_hp: float = 100.0
@export var move_speed: float = 200.0
@export var attack_damage: float = 25.0
@export var attack_cooldown: float = 0.3

@export_group("Gameplay")
@export var can_move_while_attacking: bool = false

# State
var current_hp: float = 100.0
var is_attacking: bool = false
var facing_direction: Vector2 = Vector2.RIGHT
var can_attack: bool = true

# Nodes
@onready var sprite: ColorRect = $Sprite2D
@onready var attack_hitbox: Area2D = $AttackHitbox
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Signals
signal health_changed(new_hp: float, max_hp: float)
signal died()

func _ready():
    add_to_group("player")
    if attack_hitbox:
        attack_hitbox.monitoring = false
        attack_hitbox.body_entered.connect(_on_hitbox_body_entered)
    current_hp = max_hp
    health_changed.emit(current_hp, max_hp)

func _physics_process(delta):
    # Movement (disabled during attack)
    if not is_attacking:
        var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")

        if input_dir.length() > 0:
            velocity = input_dir * move_speed
            facing_direction = input_dir.normalized()
        else:
            velocity = Vector2.ZERO

        move_and_slide()

        # Update sprite flip based on movement
        if input_dir.x != 0:
            sprite.flip_h = input_dir.x < 0
    else:
        velocity = Vector2.ZERO

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("attack") and can_attack:
        attack()

func attack() -> void:
    if not can_attack:
        return

    is_attacking = true
    can_attack = false

    # Position hitbox in front of player
    if attack_hitbox:
        attack_hitbox.position = facing_direction * 30
        attack_hitbox.monitoring = true

    # Play attack animation
    if animation_player and animation_player.has_animation("attack"):
        animation_player.play("attack")

    # Attack duration
    await get_tree().create_timer(attack_cooldown).timeout

    if attack_hitbox:
        attack_hitbox.monitoring = false
    is_attacking = false
    can_attack = true

func _on_hitbox_body_entered(body: Node2D) -> void:
    if body.is_in_group("enemies") and body.has_method("take_damage"):
        body.take_damage(attack_damage)

func take_damage(amount: float) -> void:
    current_hp -= amount
    current_hp = maxf(current_hp, 0.0)
    health_changed.emit(current_hp, max_hp)

    # Flash red effect
    if sprite:
        sprite.modulate = Color.RED
        await get_tree().create_timer(0.1).timeout
        if is_instance_valid(sprite):
            sprite.modulate = Color.WHITE

    if current_hp <= 0:
        die()

func die() -> void:
    died.emit()
    print("Player died!")
    # Reload scene after delay
    await get_tree().create_timer(1.0).timeout
    get_tree().reload_current_scene()

func heal(amount: float) -> void:
    current_hp = minf(current_hp + amount, max_hp)
    health_changed.emit(current_hp, max_hp)
