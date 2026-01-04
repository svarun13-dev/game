extends CharacterBody2D
class_name Enemy

# Stats
@export_group("Stats")
@export var max_hp: float = 50.0
@export var move_speed: float = 100.0
@export var attack_damage: float = 10.0

@export_group("AI Behavior")
@export var detection_range: float = 300.0
@export var attack_range: float = 50.0
@export var attack_cooldown_time: float = 1.5

# State
enum State { IDLE, CHASE, ATTACK, DEAD }
var current_state: State = State.IDLE
var current_hp: float = 50.0
var player: CharacterBody2D = null
var attack_cooldown: float = 0.0

# Nodes
@onready var sprite: Sprite2D = $Sprite2D
@onready var health_bar: ProgressBar = $HealthBar

func _ready() -> void:
    add_to_group("enemies")
    current_hp = max_hp
    update_health_bar()

func _physics_process(delta: float) -> void:
    if current_state == State.DEAD:
        return

    # Update attack cooldown
    if attack_cooldown > 0:
        attack_cooldown -= delta

    # Find player if not already found
    if player == null:
        var players = get_tree().get_nodes_in_group("player")
        if players.size() > 0:
            player = players[0]
        else:
            return

    var distance_to_player = global_position.distance_to(player.global_position)

    # State machine
    match current_state:
        State.IDLE:
            if distance_to_player <= detection_range:
                current_state = State.CHASE

        State.CHASE:
            if distance_to_player <= attack_range:
                current_state = State.ATTACK
            elif distance_to_player > detection_range * 1.2:
                current_state = State.IDLE
            else:
                # Move toward player
                var direction = (player.global_position - global_position).normalized()
                velocity = direction * move_speed
                move_and_slide()

                # Flip sprite based on direction
                if direction.x != 0:
                    sprite.flip_h = direction.x < 0

        State.ATTACK:
            if distance_to_player > attack_range:
                current_state = State.CHASE
            elif attack_cooldown <= 0:
                perform_attack()

func perform_attack() -> void:
    attack_cooldown = attack_cooldown_time

    if player and player.has_method("take_damage"):
        player.take_damage(attack_damage)

func take_damage(amount: float) -> void:
    if current_state == State.DEAD:
        return

    current_hp -= amount
    current_hp = maxf(current_hp, 0.0)
    update_health_bar()

    # Flash red effect
    if sprite:
        sprite.modulate = Color.RED
        await get_tree().create_timer(0.1).timeout
        if current_state != State.DEAD and is_instance_valid(sprite):
            sprite.modulate = Color.WHITE

    # Knockback effect
    if player:
        var knockback_dir: Vector2 = (global_position - player.global_position).normalized()
        velocity = knockback_dir * 200.0

    if current_hp <= 0:
        die()

func die() -> void:
    current_state = State.DEAD
    set_physics_process(false)

    # Death animation (fade out)
    if sprite:
        var tween: Tween = create_tween()
        tween.tween_property(sprite, "modulate:a", 0.0, 0.5)
        await tween.finished

    queue_free()

func update_health_bar() -> void:
    if health_bar:
        health_bar.max_value = max_hp
        health_bar.value = current_hp
