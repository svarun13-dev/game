extends CanvasLayer

@onready var health_bar = $HealthBar
@onready var health_label = $HealthBar/HealthLabel

func _ready():
    # Find player and connect to health signal
    await get_tree().process_frame  # Wait for player to be ready
    var player = get_tree().get_first_node_in_group("player")
    if player:
        player.health_changed.connect(_on_player_health_changed)
        # Initialize with current health
        _on_player_health_changed(player.current_hp, player.max_hp)

func _on_player_health_changed(current_hp: float, max_hp: float):
    if health_bar:
        health_bar.max_value = max_hp
        health_bar.value = current_hp

    if health_label:
        health_label.text = "%d / %d HP" % [current_hp, max_hp]
