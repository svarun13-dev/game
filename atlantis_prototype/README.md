# Atlantis RPG - Playable Prototype (Godot 4.5)

A minimal working prototype to test core combat mechanics.

**Built specifically for Godot 4.5** with modern best practices!

## 🎮 What's Included

**Features:**
- Player movement (WASD or Arrow Keys)
- Basic attack system (Left Click or Space)
- Enemy AI (chase and attack player)
- Health system for player and enemies
- Simple combat with damage and knockback
- Health bar UI

**What You'll See:**
- Blue square = Player (you!)
- Red squares = Enemies
- Health bars above enemies
- Your health bar in top-left corner

## 🚀 How to Run

### Step 1: Install Godot
1. Download **Godot 4.5 or later** from: https://godotengine.org/download
2. Extract and run the Godot executable

**Note:** This project uses Godot 4.5 features. Earlier versions may not work correctly.

### Step 2: Open the Project
1. Launch Godot
2. Click **"Import"**
3. Navigate to this `atlantis_prototype` folder
4. Select the `project.godot` file
5. Click **"Import & Edit"**

### Step 3: Play!
1. Press **F5** or click the **Play button** (▶) in top-right
2. The game will start immediately!

## 🎯 Controls

**Movement:**
- `W` / `↑` - Move Up
- `A` / `←` - Move Left
- `S` / `↓` - Move Down
- `D` / `→` - Move Right

**Combat:**
- `Left Click` or `Space` - Attack

## 🎲 Gameplay

- **Objective:** Defeat all 4 enemies!
- Move around the arena
- Get close to enemies and attack them
- Enemies will chase and attack you back
- Each enemy has 50 HP, you have 100 HP
- Enemy health bars show damage
- If you die, the game restarts

## 🧪 What's Being Tested

This prototype validates:
- ✅ Player movement feels responsive
- ✅ Attack hitbox detection works
- ✅ Enemy AI chases player
- ✅ Damage system functions
- ✅ Health bars update correctly
- ✅ Basic combat loop is fun

## 🔧 Technical Details

**Built with:**
- Godot Engine 4.5+
- GDScript with full type hints
- Modern Godot 4.5 features:
  - `@export_group` for organized inspector
  - `class_name` for type safety
  - Typed function signatures
  - `maxf()`/`minf()` float functions
  - `is_instance_valid()` checks
- Resolution: 1280x720

**Structure:**
```
atlantis_prototype/
├── scenes/
│   ├── player/player.tscn
│   ├── enemies/enemy.tscn
│   ├── ui/player_hud.tscn
│   └── world/test_world.tscn (main scene)
├── scripts/
│   ├── player/player_controller.gd
│   ├── enemies/enemy_base.gd
│   └── ui/player_hud.gd
└── project.godot
```

## 🐛 Known Limitations

This is a bare-bones prototype:
- No sprites (using colored rectangles)
- No animations (except attack pulse)
- No sound effects or music
- No multiple abilities
- No inventory or equipment
- No XP/leveling
- No world exploration

**These will be added in future iterations!**

## 🚧 Next Steps

After testing this prototype:
1. Add proper sprite graphics
2. Implement Mana system
3. Add class-specific abilities
4. Create actual game world
5. Add NPCs and dialogue
6. Implement quest system

## 💡 Tips

- **Camera follows player** automatically
- **Enemies turn red** when you hit them
- **You turn red** when enemies hit you
- Try **kiting** - hit and run away!
- Enemies have **knockback** when damaged

## ⚠️ Troubleshooting

**Game won't start?**
- Make sure you're using **Godot 4.5 or later** (4.4 and below may have issues)
- Check that all files were extracted properly
- Try pressing F5 instead of clicking Play

**Script errors about types?**
- This project uses Godot 4.5's type system
- Download the latest version of Godot 4.5+

**Enemies not moving?**
- They need to detect you first (get closer)
- Detection range is 300 pixels

**Attack not working?**
- Make sure you're clicking Left Mouse or pressing Space
- There's a 0.3 second attack animation

**Can't move during attack?**
- This is intentional! Attack locks movement briefly

## 🎉 Enjoy!

This is just the beginning of the Atlantis RPG journey. Have fun testing the combat!

For full game design, see `/docs` in the main repository.

---

**Feedback?** Note what feels good and what needs improvement!
