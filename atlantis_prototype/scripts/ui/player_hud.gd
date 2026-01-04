extends CanvasLayer

@onready var health_bar: ProgressBar = $HealthBar
@onready var health_label: Label = $HealthBar/HealthLabel

func _ready() -> void:
    # Find player and connect to health signal
    await get_tree().process_frame  # Wait for player to be ready
    var player: Player = get_tree().get_first_node_in_group("player") as Player
    if player:
        player.health_changed.connect(_on_player_health_changed)
        # Initialize with current health
        _on_player_health_changed(player.current_hp, player.max_hp)

func _on_player_health_changed(current_hp: float, max_hp: float) -> void:
    if health_bar:
        health_bar.max_value = max_hp
        health_bar.value = current_hp

    if health_label:
        health_label.text = "%d / %d HP" % [int(current_hp), int(max_hp)]
