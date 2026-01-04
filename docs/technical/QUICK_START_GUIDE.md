# Quick Start Guide
## Getting Started with Atlantis RPG Development

---

## 🚀 Setting Up Development Environment

### Prerequisites

**Required:**
- **Godot Engine 4.2+** - [Download here](https://godotengine.org/download)
- **Git** - For version control
- **Text Editor** - VS Code, Sublime, or Godot's built-in editor

**Recommended:**
- **Aseprite** or **Piskel** - For sprite creation/editing
- **Tiled** - For tilemap design (export to Godot)
- **LMMS** or **Audacity** - For audio work

---

## 📋 Step-by-Step Setup

### 1. Install Godot

1. Download Godot 4.2+ from [godotengine.org](https://godotengine.org)
2. Extract and run the executable
3. (Optional) Add to system PATH for command-line access

### 2. Clone/Create Project

```bash
# If using this repository
git clone <repository-url>
cd atlantis_rpg

# Or start fresh with Godot
# Open Godot → New Project → Select folder → Create
```

### 3. Project Structure

Create the following folder structure (or use the one in the repo):

```
atlantis_rpg/
├── assets/
├── scenes/
├── scripts/
├── resources/
├── data/
└── docs/
```

Refer to [GODOT_PROJECT_STRUCTURE.md](GODOT_PROJECT_STRUCTURE.md) for complete structure.

---

## 🎮 First Steps - Building the Prototype

### Phase 1: Player Movement (Day 1)

**Goal:** Get a sprite moving on screen

#### 1.1 Create Player Scene

1. In Godot: Scene → New Scene → 2D Scene
2. Rename root node to "Player"
3. Change type to `CharacterBody2D`
4. Add child nodes:
   - `Sprite2D` (temporary, use colored rectangle)
   - `CollisionShape2D` (add RectangleShape2D)
5. Save as `scenes/characters/player/player.tscn`

#### 1.2 Player Movement Script

Attach script to Player node (`scripts/player/player_controller.gd`):

```gdscript
extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
    # Get input direction
    var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

    # Apply movement
    velocity = direction * SPEED

    # Move the character
    move_and_slide()
```

#### 1.3 Test Scene

1. Create new scene: `scenes/main/test_world.tscn`
2. Add root node: `Node2D`
3. Instance player scene as child
4. Run scene (F6)
5. Test movement with arrow keys

**Success Criteria:** Player sprite moves in 8 directions smoothly

---

### Phase 2: Basic Combat (Day 2-3)

**Goal:** Player can attack and deal damage

#### 2.1 Attack Animation

Update `player_controller.gd`:

```gdscript
extends CharacterBody2D

const SPEED = 200.0

var is_attacking = false

func _physics_process(delta):
    if is_attacking:
        velocity = Vector2.ZERO
    else:
        var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
        velocity = direction * SPEED

    move_and_slide()

func _input(event):
    if event.is_action_pressed("attack") and not is_attacking:
        attack()

func attack():
    is_attacking = true
    # Play attack animation (placeholder)
    print("Attack!")
    await get_tree().create_timer(0.3).timeout  # Attack duration
    is_attacking = false
```

Add input mapping:
- Project → Project Settings → Input Map
- Add action "attack" → Map to Left Mouse Button

#### 2.2 Hitbox System

Add to Player scene:
- `Area2D` named "AttackHitbox"
  - `CollisionShape2D` (small rectangle in front of player)
  - Initially disabled

Update script:

```gdscript
@onready var hitbox = $AttackHitbox

func attack():
    is_attacking = true
    hitbox.monitoring = true
    print("Attack!")
    await get_tree().create_timer(0.3).timeout
    hitbox.monitoring = false
    is_attacking = false

func _ready():
    hitbox.monitoring = false
    hitbox.area_entered.connect(_on_hitbox_entered)

func _on_hitbox_entered(area):
    if area.is_in_group("enemies"):
        print("Hit enemy!")
        # Deal damage (next step)
```

**Success Criteria:** Console prints "Attack!" when clicking, hitbox activates

---

### Phase 3: Simple Enemy (Day 4-5)

**Goal:** Create enemy that takes damage and dies

#### 3.1 Enemy Scene

Create `scenes/characters/enemies/enemy_base.tscn`:
- `CharacterBody2D` root
- `Sprite2D` (different color from player)
- `CollisionShape2D`
- `Area2D` named "Hurtbox"
  - `CollisionShape2D`

#### 3.2 Enemy Script

Create `scripts/enemies/enemy_base.gd`:

```gdscript
extends CharacterBody2D

@export var max_hp: float = 50.0
var current_hp: float = 50.0

@onready var hurtbox = $Hurtbox

func _ready():
    hurtbox.add_to_group("enemies")
    hurtbox.area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(area):
    if area.get_parent().is_in_group("player"):
        take_damage(10.0)  # Placeholder damage

func take_damage(amount: float):
    current_hp -= amount
    print("Enemy HP: ", current_hp)

    if current_hp <= 0:
        die()

func die():
    print("Enemy died!")
    queue_free()
```

#### 3.3 Connect Systems

Update player script to add group:

```gdscript
func _ready():
    add_to_group("player")
    hitbox.monitoring = false
    hitbox.area_entered.connect(_on_hitbox_entered)

func _on_hitbox_entered(area):
    if area.is_in_group("enemies"):
        var enemy = area.get_parent()
        if enemy.has_method("take_damage"):
            enemy.take_damage(25.0)
```

Add enemy to test world and test!

**Success Criteria:** Attacking enemy reduces HP, enemy dies after multiple hits

---

### Phase 4: Health & UI (Day 6-7)

**Goal:** Player has health, visible on screen

#### 4.1 Player Stats

Update player script:

```gdscript
@export var max_hp: float = 100.0
var current_hp: float = 100.0

signal health_changed(new_hp, max_hp)

func take_damage(amount: float):
    current_hp -= amount
    health_changed.emit(current_hp, max_hp)

    if current_hp <= 0:
        die()

func die():
    print("Player died!")
    get_tree().reload_current_scene()
```

#### 4.2 Health Bar UI

Create `scenes/ui/hud/health_bar.tscn`:
- `CanvasLayer` root
- `ProgressBar` (style it red)

Script `scripts/ui/health_bar.gd`:

```gdscript
extends ProgressBar

func _ready():
    var player = get_tree().get_first_node_in_group("player")
    if player:
        player.health_changed.connect(_on_health_changed)
        max_value = player.max_hp
        value = player.current_hp

func _on_health_changed(new_hp, max_hp):
    max_value = max_hp
    value = new_hp
```

Add HealthBar to test world or make it autoload.

**Success Criteria:** Health bar displays, decreases when taking damage

---

## 🎯 Next Milestones

After the prototype above works:

### Week 2
- Implement Mana system (similar to HP)
- Add one spell ability (e.g., Fireball for Mage)
- Create simple AI (enemy chases player)

### Week 3
- Build first area of Central Atlantis
- Add NPC with basic dialogue
- Implement simple quest (talk to NPC → kill enemies → return)

### Week 4
- Add Solar Energy system
- Implement character stats (STR, INT, etc.)
- Create inventory system

---

## 📚 Learning Resources

### Godot Tutorials
- **Official Docs:** [docs.godotengine.org](https://docs.godotengine.org)
- **Your First 2D Game:** [Official tutorial](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html)
- **Heartbeast (YouTube):** Action RPG series for Godot
- **GDQuest:** High-quality Godot courses

### Game Design
- Read this project's design docs in `/docs/game_design/`
- Study JRPGs: Final Fantasy, Chrono Trigger, Octopath Traveler
- Study action combat: Hades, Hyper Light Drifter

### Art & Audio
- **OpenGameArt.org:** Free placeholder assets
- **Kenney.nl:** Free game assets
- **Freesound.org:** Free sound effects

---

## 🐛 Common Issues & Solutions

### Player moves too fast/slow
Adjust `SPEED` constant in player script

### Collision not working
- Check collision layers and masks
- Ensure CollisionShape2D has a shape assigned
- Use debugger: Debug → Visible Collision Shapes

### Script errors
- Check for typos in node paths (`$NodeName`)
- Verify signals are connected
- Use `print()` statements for debugging

### Performance issues
- Godot 4.x needs decent GPU for 2D
- Disable v-sync if testing: Project Settings → Display → Window → V-Sync

---

## ✅ Development Checklist

Use this to track progress:

### Core Systems
- [ ] Player movement (8-directional)
- [ ] Basic attack
- [ ] Damage system (hitbox/hurtbox)
- [ ] Player health + death
- [ ] Simple enemy AI
- [ ] Health bar UI
- [ ] Mana system
- [ ] Solar Energy system
- [ ] Ability system (3-5 abilities)
- [ ] Enemy variety (3+ types)
- [ ] Boss fight
- [ ] Level/XP system
- [ ] Inventory system
- [ ] Equipment system
- [ ] Save/Load

### World
- [ ] One complete area (Central Atlantis)
- [ ] NPC interaction
- [ ] Dialogue system
- [ ] Quest system
- [ ] One dungeon (Coastal Cliffs)
- [ ] Environmental hazards
- [ ] Day/night cycle

### Polish
- [ ] Animations for all actions
- [ ] Particle effects
- [ ] Sound effects
- [ ] Music tracks
- [ ] Polished UI
- [ ] Pause menu
- [ ] Settings (volume, controls)

---

## 🎮 Testing Your Build

### Daily Testing
- Run the game after every major change
- Test all player abilities
- Walk around entire map looking for bugs

### Weekly Testing
- Full playthrough of available content
- Test edge cases (0 HP, 0 Mana, etc.)
- Get feedback from others

### Before Release
- Complete demo start-to-finish 3+ times
- Test on different PCs
- Get external playtesters

---

## 📞 Getting Help

**Stuck on implementation?**
1. Check Godot documentation
2. Search Godot forums/Discord
3. Review this project's design docs
4. Ask in gamedev communities (r/godot, Godot Discord)

**Design questions?**
- Refer to `/docs/game_design/` documents
- Prototype and iterate
- Playtest early and often

---

## 🎯 Success Metrics

**You're making good progress if:**
- Can play for 30+ seconds without crashing
- Combat feels responsive and fun
- You're excited to show others
- New features don't break old ones
- You're learning and improving

**Ready for demo release when:**
- 1-2 hours of polished gameplay
- No game-breaking bugs
- Clear objective and story hook
- Fun to replay with different classes

---

**Good luck, and may your code be bug-free!** ⚡

For detailed technical architecture, see [GODOT_PROJECT_STRUCTURE.md](GODOT_PROJECT_STRUCTURE.md)
