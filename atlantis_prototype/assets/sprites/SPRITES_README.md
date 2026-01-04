# Sprite Assets
## Atlantis RPG Prototype

---

## 🎨 Overview

This folder contains all sprite graphics for the Atlantis RPG prototype. All sprites are in SVG format for crisp, scalable rendering in Godot.

**Style:** Top-down view, Atlantean/Greek mythology theme
**Format:** SVG (vector graphics)
**Size:** 64x64 pixels base canvas

---

## 👤 Player Sprites

### hero.svg
**Character:** Atlantean Hero/Warrior
**Description:** Young hero with blue tunic and gold accents

**Visual Elements:**
- **Blue tunic** - Main body (Atlantean color)
- **Gold belt and armor shoulders** - Royal/heroic accents
- **Gold headband** - Atlantean nobility marker
- **Brown hair** - Natural coloring
- **Sword at belt** - Armed and ready
- **Skin tone** - Warm Mediterranean complexion

**Color Palette:**
- Primary: `#3498db` (Blue - tunic)
- Accent: `#f39c12` (Gold - armor/belt)
- Skin: `#f4c8a3` (Light tan)
- Hair: `#5d4037` (Dark brown)

**Usage:** Default player character sprite

---

## 👾 Enemy Sprites

### 1. wolf.svg
**Enemy Type:** Wild Wolf
**Difficulty:** Easy
**HP:** 50

**Visual Elements:**
- **Grey fur** - Main body color
- **Dark grey back** - Shading/depth
- **Red glowing eyes** - Fierce, aggressive
- **Dark paws and nose** - Detail work
- **Ears pointed** - Alert stance

**Color Palette:**
- Body: `#78909c` (Grey)
- Shading: `#546e7a` (Dark grey)
- Eyes: `#ff5252` (Red - menacing)

**Behavior:** Chases player, basic melee attack
**Lore:** Wild beasts from the outskirts of Atlantis

---

### 2. bandit.svg
**Enemy Type:** Bandit/Thief
**Difficulty:** Medium
**HP:** 50

**Visual Elements:**
- **Dark hooded cloak** - Mysterious, villainous
- **Red glowing eyes** - Threat indicator
- **Dagger weapon** - Armed combatant
- **Masked face** - Shadowy identity
- **Pouches on belt** - Thief aesthetic

**Color Palette:**
- Cloak: `#455a64` (Dark grey-blue)
- Hood: `#37474f` (Very dark grey)
- Eyes: `#ff6b6b` (Red - dangerous)
- Belt: `#5d4037` (Brown leather)

**Behavior:** Chases player, melee attacks
**Lore:** Criminals preying on travelers near Atlantis

---

### 3. sea_creature.svg
**Enemy Type:** Corrupted Sea Creature / Sea Nymph
**Difficulty:** Hard
**HP:** 75 (more than basic enemies)
**Damage:** 15 (stronger attacks)

**Visual Elements:**
- **Purple mystical body** - Magical/corrupted
- **Glowing cyan eyes** - Supernatural
- **Tentacle-like appendages** - Aquatic creature
- **Crystal growths** - Corrupted by Solar Energy?
- **Ethereal glow** - Otherworldly presence
- **Wispy energy** - Magical aura

**Color Palette:**
- Body: `#673ab7` (Deep purple)
- Glow: `#9575cd` (Light purple)
- Eyes/Crystals: `#00e5ff` (Cyan - mystical)
- Dark veins: `#1a237e` (Very dark purple - corruption)

**Behavior:** Chases player, stronger attacks
**Lore:** Creature from the depths, corrupted by Atlantean Solar Crystal experiments. Hint at the dark side of Atlantis's technology.

---

## 🎮 Implementation in Godot

### Importing SVGs

Godot 4.5 automatically imports SVG files as textures:
1. Place SVG in `assets/sprites/` folder
2. Godot imports on project reload
3. Use as `Texture2D` in `Sprite2D` nodes

### Using Sprites in Scenes

**Player Scene:**
```gdscript
[node name="Sprite2D" type="Sprite2D" parent="."]
texture = ExtResource("res://assets/sprites/player/hero.svg")
```

**Enemy Scenes:**
```gdscript
# Wolf
texture = ExtResource("res://assets/sprites/enemies/wolf.svg")

# Bandit
texture = ExtResource("res://assets/sprites/enemies/bandit.svg")

# Sea Creature
texture = ExtResource("res://assets/sprites/enemies/sea_creature.svg")
```

### Sprite Offset

All sprites use `offset = Vector2(0, -8)` to center them properly on their collision shapes.

---

## 🎨 Design Philosophy

### Atlantean Theme
- **Blues and purples** - Ocean/water association
- **Gold accents** - Royal, advanced civilization
- **Mystical elements** - Magic and technology blend

### Top-Down Perspective
- All sprites designed for overhead camera view
- Clear silhouettes for gameplay readability
- Facing direction implied but flexible (can flip horizontally)

### Color Coding
- **Blue = Hero/Allies** - Player is easily identifiable
- **Grey/Brown = Natural enemies** - Wolves, animals
- **Dark colors = Hostile humans** - Bandits, criminals
- **Purple/Cyan = Magical/Corrupted** - Supernatural threats

---

## 🔄 Future Sprite Additions

### Planned
- **Mage hero variant** - More robes, staff instead of sword
- **Warrior hero variant** - Heavy armor, larger weapon
- **Boss creatures** - Larger sprites (96x96 or 128x128)
- **NPCs** - Friendly characters for city areas
- **Environmental sprites** - Props, decorations

### Animation Frames
Currently sprites are static. Future additions:
- Walk cycles (4-8 frames)
- Attack animations (3-5 frames)
- Hurt/damage frames
- Death animations

---

## 📏 Technical Specs

**Canvas Size:** 64x64 pixels
**Format:** SVG (Scalable Vector Graphics)
**Compatibility:** Godot 4.5+
**File Size:** ~1-3 KB per sprite (lightweight)

**Benefits of SVG:**
- Scales without pixelation
- Small file size
- Easy to edit and modify
- Godot renders them efficiently

---

## 🎭 Sprite Credits

**Created by:** Claude (AI Assistant)
**Date:** 2026-01-04
**Style:** Simple vector art, Atlantean/Greek mythology inspired
**License:** Use freely within this project

---

## 📝 Notes for Artists

If you want to replace these with custom artwork:

1. **Keep the same dimensions** (64x64 base)
2. **Maintain top-down perspective**
3. **Use clear silhouettes** for gameplay readability
4. **Follow color coding** (blue = hero, etc.)
5. **Export as PNG or SVG** - both work in Godot
6. **Name files identically** to avoid breaking scene references

**Recommended Tools:**
- **Inkscape** (free SVG editor)
- **Aseprite** (pixel art, export as PNG)
- **GIMP** (raster graphics)
- **Adobe Illustrator** (professional vector)

---

**Version:** 1.0
**Last Updated:** 2026-01-04
