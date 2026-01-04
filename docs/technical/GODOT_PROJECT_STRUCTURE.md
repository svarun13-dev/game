# Godot Project Structure
## Atlantis: Fall of the Eternal City

---

## 🎮 Godot Engine Specifications

**Engine Version:** Godot 4.x (recommended: 4.2+)
**Language:** GDScript (primary), C# (optional for performance-critical systems)
**Rendering:** 2D renderer
**Target Platforms:** PC (Windows, Mac, Linux), potential mobile later

---

## 📁 Project Directory Structure

```
atlantis_rpg/
│
├── .godot/                     # Godot engine cache (auto-generated)
├── .import/                    # Import cache (auto-generated)
│
├── assets/                     # All game assets
│   ├── sprites/
│   │   ├── characters/
│   │   │   ├── hero/
│   │   │   │   ├── warrior/
│   │   │   │   ├── mage/
│   │   │   │   ├── archer/
│   │   │   │   ├── priest/
│   │   │   │   ├── rogue/
│   │   │   │   └── animalist/
│   │   │   ├── npcs/
│   │   │   └── enemies/
│   │   ├── environment/
│   │   │   ├── tilesets/
│   │   │   ├── props/
│   │   │   └── parallax/
│   │   ├── effects/
│   │   │   ├── particles/
│   │   │   ├── abilities/
│   │   │   └── ui_effects/
│   │   └── items/
│   │
│   ├── audio/
│   │   ├── music/
│   │   │   ├── menu/
│   │   │   ├── exploration/
│   │   │   ├── combat/
│   │   │   └── cutscenes/
│   │   ├── sfx/
│   │   │   ├── abilities/
│   │   │   ├── combat/
│   │   │   ├── ambient/
│   │   │   └── ui/
│   │   └── voice/ (optional)
│   │
│   ├── fonts/
│   │   ├── main_font.ttf
│   │   ├── title_font.ttf
│   │   └── dialogue_font.ttf
│   │
│   └── shaders/
│       ├── water.gdshader
│       ├── glow.gdshader
│       └── transition.gdshader
│
├── scenes/                     # All .tscn files
│   ├── main/
│   │   ├── main.tscn          # Root scene
│   │   └── game_manager.tscn   # Singleton manager
│   │
│   ├── ui/
│   │   ├── hud/
│   │   │   ├── health_bar.tscn
│   │   │   ├── mana_bar.tscn
│   │   │   ├── solar_bar.tscn
│   │   │   ├── minimap.tscn
│   │   │   └── hotbar.tscn
│   │   ├── menus/
│   │   │   ├── main_menu.tscn
│   │   │   ├── pause_menu.tscn
│   │   │   ├── inventory.tscn
│   │   │   ├── character_sheet.tscn
│   │   │   ├── quest_journal.tscn
│   │   │   └── settings.tscn
│   │   └── dialogue/
│   │       └── dialogue_box.tscn
│   │
│   ├── characters/
│   │   ├── player/
│   │   │   ├── player_base.tscn
│   │   │   ├── warrior.tscn
│   │   │   ├── mage.tscn
│   │   │   ├── archer.tscn
│   │   │   ├── priest.tscn
│   │   │   ├── rogue.tscn
│   │   │   └── animalist.tscn
│   │   ├── npcs/
│   │   │   ├── npc_base.tscn
│   │   │   ├── merchant.tscn
│   │   │   └── quest_giver.tscn
│   │   └── enemies/
│   │       ├── enemy_base.tscn
│   │       ├── wolf.tscn
│   │       ├── bandit.tscn
│   │       └── boss_sea_nymph.tscn
│   │
│   ├── world/
│   │   ├── areas/
│   │   │   ├── central_atlantis.tscn
│   │   │   ├── western_quarter.tscn
│   │   │   ├── outer_gardens.tscn
│   │   │   └── coastal_cliffs.tscn
│   │   ├── interiors/
│   │   │   ├── temple_poseidon.tscn
│   │   │   ├── academy.tscn
│   │   │   ├── tavern.tscn
│   │   │   └── hero_home.tscn
│   │   ├── dungeons/
│   │   │   └── smugglers_cave.tscn
│   │   └── props/
│   │       ├── solar_obelisk.tscn
│   │       ├── mana_well.tscn
│   │       └── chest.tscn
│   │
│   ├── abilities/
│   │   ├── warrior/
│   │   ├── mage/
│   │   ├── archer/
│   │   ├── priest/
│   │   ├── rogue/
│   │   └── animalist/
│   │
│   └── vfx/
│       ├── mana_particles.tscn
│       ├── solar_particles.tscn
│       └── hit_effect.tscn
│
├── scripts/                    # All .gd files
│   ├── autoload/              # Singleton scripts
│   │   ├── game_manager.gd
│   │   ├── resource_manager.gd
│   │   ├── audio_manager.gd
│   │   ├── save_system.gd
│   │   ├── event_bus.gd
│   │   └── globals.gd
│   │
│   ├── player/
│   │   ├── player_controller.gd
│   │   ├── player_stats.gd
│   │   ├── input_handler.gd
│   │   ├── ability_system.gd
│   │   └── classes/
│   │       ├── class_base.gd
│   │       ├── warrior.gd
│   │       ├── mage.gd
│   │       ├── archer.gd
│   │       ├── priest.gd
│   │       ├── rogue.gd
│   │       └── animalist.gd
│   │
│   ├── combat/
│   │   ├── damage_system.gd
│   │   ├── hitbox.gd
│   │   ├── hurtbox.gd
│   │   ├── projectile.gd
│   │   └── status_effects.gd
│   │
│   ├── enemies/
│   │   ├── enemy_base.gd
│   │   ├── enemy_ai.gd
│   │   ├── patrol_behavior.gd
│   │   ├── chase_behavior.gd
│   │   └── specific_enemies/
│   │       ├── wolf.gd
│   │       ├── bandit.gd
│   │       └── boss_sea_nymph.gd
│   │
│   ├── resources/
│   │   ├── mana_system.gd
│   │   ├── solar_system.gd
│   │   └── resource_bar.gd
│   │
│   ├── ui/
│   │   ├── hud_manager.gd
│   │   ├── menu_base.gd
│   │   ├── inventory_ui.gd
│   │   ├── dialogue_system.gd
│   │   └── quest_tracker.gd
│   │
│   ├── world/
│   │   ├── area_loader.gd
│   │   ├── day_night_cycle.gd
│   │   ├── interactable.gd
│   │   ├── npc_controller.gd
│   │   └── quest_system.gd
│   │
│   ├── data/
│   │   ├── item_database.gd
│   │   ├── ability_database.gd
│   │   ├── quest_database.gd
│   │   └── dialogue_database.gd
│   │
│   └── utils/
│       ├── state_machine.gd
│       ├── camera_controller.gd
│       ├── math_utils.gd
│       └── animation_utils.gd
│
├── resources/                  # Godot resource files
│   ├── abilities/
│   │   └── ability_resource.gd
│   ├── items/
│   │   ├── item_resource.gd
│   │   ├── weapon_resource.gd
│   │   └── armor_resource.gd
│   ├── quests/
│   │   └── quest_resource.gd
│   └── stats/
│       └── stat_block.gd
│
├── data/                       # JSON/config files
│   ├── items/
│   │   ├── weapons.json
│   │   ├── armor.json
│   │   └── consumables.json
│   ├── abilities/
│   │   ├── warrior_abilities.json
│   │   ├── mage_abilities.json
│   │   └── ...
│   ├── quests/
│   │   └── act1_quests.json
│   ├── dialogues/
│   │   └── npc_dialogues.json
│   └── config/
│       ├── game_settings.json
│       └── balance.json
│
├── addons/                     # Third-party plugins (if any)
│
├── project.godot              # Godot project file
├── export_presets.cfg         # Export settings
└── README.md                  # Project README
```

---

## 🎯 Core Systems Architecture

### 1. Player System

**Components:**
- **PlayerController.gd** - Movement, input, state management
- **PlayerStats.gd** - HP, Mana, Solar, attributes
- **AbilitySystem.gd** - Skill execution, cooldowns
- **Class scripts** - Class-specific logic (inheritance from base)

**State Machine:**
```
States:
- IDLE
- MOVING
- ATTACKING
- CASTING
- DODGING
- HURT
- DEAD
```

**Input Handling:**
```gdscript
# Input map suggestions:
- move_up, move_down, move_left, move_right (WASD/Arrows)
- attack (Left Click)
- ability_1, ability_2, ability_3, ability_4 (1-4 keys)
- dodge (Space)
- interact (E)
- inventory (I)
- character (C)
- quest_log (J)
- pause (Esc)
```

---

### 2. Resource System (Mana + Solar)

**ManaSystem.gd:**
```gdscript
extends Node

var max_mana: float = 100.0
var current_mana: float = 100.0
var regen_rate: float = 2.0  # per second

func consume_mana(amount: float) -> bool:
    if current_mana >= amount:
        current_mana -= amount
        return true
    return false

func regenerate(delta: float):
    current_mana = min(current_mana + regen_rate * delta, max_mana)
```

**SolarSystem.gd:**
```gdscript
extends Node

var max_solar: float = 100.0
var current_solar: float = 0.0
var is_daytime: bool = true
var is_outdoors: bool = true

func generate_from_damage(damage_dealt: float):
    var base_gain = damage_dealt * 0.5
    if is_daytime and is_outdoors:
        base_gain *= 1.5
    current_solar = min(current_solar + base_gain, max_solar)

func consume_solar(amount: float) -> bool:
    if current_solar >= amount:
        current_solar -= amount
        return true
    return false
```

---

### 3. Combat System

**DamageSystem.gd:**
```gdscript
# Damage calculation
func calculate_damage(attacker_stats, defender_stats, ability_data):
    var base_damage = attacker_stats.strength * ability_data.damage_multiplier
    var defense = defender_stats.armor
    var final_damage = max(base_damage - defense, 1)  # Minimum 1 damage

    # Critical hit chance
    if randf() < attacker_stats.crit_chance:
        final_damage *= attacker_stats.crit_multiplier

    return final_damage
```

**Hitbox/Hurtbox System:**
- Use Area2D nodes
- Hitbox = deals damage (on weapon/projectile)
- Hurtbox = receives damage (on character body)
- Signal-based damage application

---

### 4. Enemy AI

**Simple State Machine:**
```
States:
- IDLE (patrol or stand)
- ALERT (spotted player)
- CHASE (moving toward player)
- ATTACK (in range, attacking)
- RETREAT (low health, fleeing)
- DEAD
```

**Behavior Tree (Advanced, post-demo):**
- Use addon like "Behave" or custom implementation
- More complex boss behaviors

---

### 5. Quest System

**Quest Resource:**
```gdscript
class_name Quest
extends Resource

export var quest_id: String
export var title: String
export var description: String
export var objectives: Array  # of QuestObjective
export var rewards: Dictionary  # {exp: 100, gold: 50, items: [...]}
export var prerequisites: Array  # Quest IDs required

enum Status {NOT_STARTED, ACTIVE, COMPLETED, FAILED}
var status: int = Status.NOT_STARTED
```

**QuestManager (Singleton):**
- Track active quests
- Update objective progress
- Trigger completion
- Award rewards

---

### 6. Dialogue System

**DialogueSystem.gd:**
```gdscript
# JSON structure for dialogues:
{
    "npc_id": "merchant_01",
    "dialogues": [
        {
            "text": "Welcome, traveler!",
            "choices": [
                {"text": "Show me your wares", "action": "open_shop"},
                {"text": "Goodbye", "action": "close"}
            ]
        }
    ]
}
```

**DialogueBox.tscn:**
- Portrait sprite
- Text label (with typewriter effect)
- Choice buttons
- Continue indicator

---

### 7. Save System

**SaveSystem.gd (Autoload):**
```gdscript
const SAVE_PATH = "user://savegame.dat"

func save_game():
    var save_data = {
        "player": {
            "class": PlayerStats.current_class,
            "level": PlayerStats.level,
            "position": PlayerController.global_position,
            "hp": PlayerStats.current_hp,
            "mana": ManaSystem.current_mana,
            "solar": SolarSystem.current_solar,
            "stats": PlayerStats.attributes,
            "inventory": InventoryManager.get_save_data(),
        },
        "world": {
            "current_area": WorldManager.current_area,
            "time": DayNightCycle.current_time,
        },
        "quests": QuestManager.get_save_data(),
        "flags": GameManager.story_flags,
    }

    var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
    file.store_var(save_data)
    file.close()

func load_game():
    if not FileAccess.file_exists(SAVE_PATH):
        return false

    var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
    var save_data = file.get_var()
    file.close()

    # Apply loaded data...
    PlayerStats.load_data(save_data.player)
    # etc...

    return true
```

---

## 🎨 Scene Composition Best Practices

### Player Scene Structure

```
Player (CharacterBody2D)
├── Sprite2D (animated sprite)
├── CollisionShape2D (body collision)
├── Hurtbox (Area2D)
│   └── CollisionShape2D
├── Camera2D
├── AbilityContainer (Node2D)
│   ├── Ability1Marker
│   ├── Ability2Marker
│   └── ...
├── AnimationPlayer
└── AudioStreamPlayer2D (for footsteps, etc.)
```

### Enemy Scene Structure

```
Enemy (CharacterBody2D)
├── Sprite2D
├── CollisionShape2D
├── Hurtbox (Area2D)
│   └── CollisionShape2D
├── DetectionRange (Area2D)
│   └── CollisionShape2D (large circle)
├── AttackRange (Area2D)
│   └── CollisionShape2D (smaller)
├── NavigationAgent2D (for pathfinding)
├── HealthBar (UI element, optional)
└── AIController (Node with script)
```

---

## 🚀 Development Roadmap

### Phase 1: Core Systems (Week 1-2)

**Priority 1:**
- [ ] Set up Godot project structure
- [ ] Player movement and input
- [ ] Basic combat (attack animation, hitbox)
- [ ] Health system
- [ ] Simple enemy (wolf) with basic AI

**Priority 2:**
- [ ] Mana resource system
- [ ] One class fully implemented (recommend Mage or Warrior)
- [ ] 2-3 abilities working
- [ ] Basic UI (health bar, mana bar)

### Phase 2: World Building (Week 3-4)

- [ ] Tileset creation/import
- [ ] Central Atlantis area (basic layout)
- [ ] Western Quarter
- [ ] NPC system (interaction, dialogue)
- [ ] Quest system implementation
- [ ] Inventory system

### Phase 3: Content (Week 5-6)

- [ ] Outer Gardens area
- [ ] Coastal Cliffs dungeon
- [ ] 3-5 enemy types
- [ ] Mini-boss fight
- [ ] Demo questline
- [ ] Lore tablets

### Phase 4: Resources & Polish (Week 7-8)

- [ ] Solar Energy system
- [ ] Day/night cycle
- [ ] Audio implementation
- [ ] Visual effects (particles, shaders)
- [ ] UI polish
- [ ] Menu system

### Phase 5: Testing & Balance (Week 9-10)

- [ ] Playtesting
- [ ] Bug fixing
- [ ] Balance tuning
- [ ] Performance optimization
- [ ] Demo packaging

---

## 🎨 Asset Requirements

### Minimum Viable Assets for Demo

**Character Sprites:**
- 1 hero class (walk, idle, attack, cast, hurt, death) - ~30 frames
- 3 enemy types (same animations) - ~20 frames each
- 1 mini-boss (more complex) - ~40 frames
- 5 NPC types (idle, talk) - ~10 frames each

**Environment:**
- Tileset for city (ground, walls, buildings) - ~100 tiles
- Tileset for nature (grass, dirt, rocks, trees) - ~80 tiles
- Tileset for cave (stone, water, darkness) - ~60 tiles
- Props (furniture, decorations, interactive objects) - ~50 sprites

**UI:**
- Health/Mana/Solar bars
- Ability icons (4-5 per class)
- Inventory slots and item icons (20-30)
- Dialogue box and portrait frames
- Menu backgrounds and buttons

**VFX:**
- Hit sparks
- Mana particles (blue)
- Solar particles (gold)
- Ability effects (fireball, shield, etc.) - ~10 unique

**Audio:**
- 2-3 music tracks (menu, exploration, combat)
- ~20 SFX (attacks, abilities, UI, ambient)

---

## 🛠️ Recommended Godot Addons

**Consider using:**

1. **Dialogue Manager** - Community dialogue system addon
2. **Behave** - Behavior tree for AI
3. **Phantom Camera** - Advanced camera system
4. **Inventory System** - Pre-built inventory addon (or custom)
5. **Quest Manager** - Save time on quest implementation

**Don't over-addon:** Build core systems yourself for learning and control.

---

## 📝 Coding Standards

### GDScript Style Guide

```gdscript
# Use snake_case for variables and functions
var player_health: float = 100.0
func calculate_damage(base: float) -> float:
    return base * damage_multiplier

# Use PascalCase for classes
class_name PlayerController
extends CharacterBody2D

# Constants in UPPER_CASE
const MAX_SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Group related variables
# Stats
var max_hp: float = 100.0
var current_hp: float = 100.0
var defense: float = 10.0

# Movement
var velocity: Vector2 = Vector2.ZERO
var speed: float = 150.0

# Use type hints
func take_damage(amount: float, attacker: Node2D) -> void:
    current_hp -= amount
    emit_signal("health_changed", current_hp, max_hp)

# Comment complex logic
# Calculate knockback based on damage and attacker position
var knockback_dir = (global_position - attacker.global_position).normalized()
velocity = knockback_dir * (amount * 10)
```

---

## 🎯 Performance Considerations

### Optimization Tips

1. **Object Pooling:**
   - Reuse projectiles, VFX, enemies
   - Don't instantiate/free every frame

2. **Culling:**
   - Disable AI for off-screen enemies
   - Use VisibleOnScreenNotifier2D

3. **Efficient Collision:**
   - Use collision layers/masks properly
   - Minimize number of collision checks

4. **Texture Atlases:**
   - Combine sprites into atlases
   - Reduce draw calls

5. **Particle Limits:**
   - Cap particle counts
   - Use GPU particles where possible

---

## 📦 Export Settings

### Build Targets for Demo

**Primary:**
- Windows (64-bit)
- Linux (64-bit)
- macOS (Universal)

**Settings:**
- Embed PCK: Yes (for simplicity)
- Export Mode: Release
- Encryption: Optional (consider for full release)

---

**Document Version:** 1.0
**Last Updated:** 2026-01-04
**Status:** Technical Foundation Complete
