# Atlantis: Fall of the Eternal City
## Game Design Document

---

## 📖 High Concept

A 2D action-RPG set in the mythological era of Atlantis, blending Japanese RPG aesthetics with Greek mythology. Players control a young hero navigating a doomed civilization, making moral choices that shape the story as the prophesied Great Flood approaches.

---

## 🎮 Core Pillars

1. **Action-Based Combat** - Real-time battles with class-specific abilities
2. **Open World Exploration** - Witcher/WoW-style freedom within Atlantean territories
3. **Dual Magic System** - Mana (traditional) + Solar (Atlantean technology)
4. **Moral Consequences** - Choices ripple through the narrative
5. **Mythological Atmosphere** - Ancient Greece meets lost civilization mystery

---

## 🎯 Target Experience

**Genre:** 2D Action-RPG
**Art Style:** Japanese RPG aesthetic (16-bit inspired, detailed sprites)
**Perspective:** Top-down / 3/4 isometric
**Tone:** Epic, mysterious, with mounting tension as the flood approaches

---

## 👤 Protagonist

**Name:** [To be decided]
**Age:** Young adult (18-22)
**Background:** [To be decided - suggest: son of a craftsman/scholar/sailor?]
**Starting Class:** Player choice (6 options)
**Motivation:** [To be decided - survival? save loved ones? uncover truth?]

---

## 🌍 World Overview

### Setting: Atlantis and Surrounding Lands

**Time Period:** Pre-flood Atlantean era (~9600 BCE according to Plato)

**Key Locations (Full Game):**
- **Atlantis** - Capital city, concentric rings, advanced technology
- **Poseidonis** - Northern port city
- **Azoria** - Mountain settlement, mining community
- **Thalassos** - Coastal fishing villages
- **The Wildlands** - Untamed territories with mythological creatures
- **Ancient Temples** - Dedicated to the Pantheon
- **The Deep Catacombs** - Underground ruins, forbidden knowledge

**Demo Scope:**
- Central Atlantis (main city district)
- Western Quarter (residential/market)
- The Outer Gardens (farmland/wilderness transition)
- Coastal Cliffs (first dungeon/cave system)

---

## ⚔️ Combat System

### Core Mechanics
- **Real-time action combat** (not turn-based)
- **Dodge/Roll** mechanic with i-frames
- **Light/Heavy attacks** + **Class abilities**
- **Resource management:** Health, Mana, Solar Energy
- **Enemy tells** - telegraphed attacks for skill-based combat

### Class-Specific Combat
Each class has unique:
- Attack patterns
- Special abilities (3-5 per class)
- Resource usage (Mana vs Solar vs Stamina)
- Weapon types

---

## 🎓 Character Progression

### Base Classes (6)

See `CHARACTER_CLASSES.md` for full details.

1. **Warrior** - Melee tank, high defense
2. **Mage** - Elemental magic, high Mana use
3. **Archer** - Ranged physical, mobility
4. **Priest** - Healing/support, divine magic
5. **Rogue** - Stealth, critical hits, speed
6. **Animalist** - Beast summoning/shapeshifting, nature magic

### Advanced Classes
*Unlocked later through story/achievements*
- Ideas: Atlantean Guardian, Solar Invoker, Tidal Sage, Shadow Dancer, etc.

### Progression Systems
- **Experience & Levels** (1-50 planned, 1-10 for demo)
- **Skill Trees** - 3 branches per class
- **Equipment** - Weapons, Armor, Accessories
- **Attribute Points** - STR, DEX, INT, WIS, VIT, LUCK

---

## ✨ Magic System

### Dual Energy System

**1. Mana (Traditional Magic)**
- Blue energy, regenerates slowly over time
- Used by: Mage, Priest, Animalist primarily
- Sources: Rest, potions, meditation
- Associated with: Elements, healing, nature

**2. Solar Energy (Atlantean Technology)**
- Gold/amber energy, charges from combat and sunlight
- Used by: All classes (some more than others)
- Sources: Dealing damage, special Solar Crystals, daytime bonus
- Associated with: Atlantean tech, enhanced abilities, divine power
- **Unique mechanic:** Stronger during day, weaker at night/indoors

### Hybrid Abilities
Some advanced skills consume BOTH resources for powerful effects.

See `MAGIC_SYSTEM.md` for full details.

---

## 🗺️ World Design

### Open World Structure
- **Hub & Spoke** - Atlantis as central hub
- **Seamless zones** - No loading between outdoor areas
- **Fast travel** - Unlock waypoints/portals
- **Day/Night cycle** - Affects Solar magic, NPC schedules, some quests
- **Weather system** (optional) - Could affect combat/magic

### Exploration Rewards
- Hidden chests
- Lore tablets (world-building)
- Mythological creature encounters
- Secret areas with rare items

---

## 📜 Story & Narrative

### Main Plot Arc
- **Act 1:** Hero's ordinary life disrupted by strange omens
- **Act 2:** Uncovering conspiracy/truth about the coming flood
- **Act 3:** Race against time, moral choices, climactic flood event

### Moral Choice System
- **Binary choices** with clear consequences (save X or Y)
- **Faction relationships** - Help different city groups
- **Multiple endings** based on accumulated choices
- **No "good/bad" meter** - choices are contextual and gray

### Demo Story
- Introduce hero and their chosen path (class)
- First signs of unrest in Atlantis
- Initial encounter with mythological threat
- Meet 2-3 key NPCs who will return later
- End on cliffhanger/prophecy revelation

See `STORY_OUTLINE.md` for full narrative.

---

## 🎨 Art Direction

### Visual Style
- **2D sprite-based** graphics
- **JRPG aesthetic** - detailed character sprites, expressive portraits
- **16-bit inspired** but higher resolution (HD sprites)
- **Rich color palette** - Blues, golds, marble whites, sunset oranges

### UI/UX
- **Minimalist HUD** - Health/Mana/Solar bars, minimap
- **Stylized menus** - Greek architectural motifs
- **Dialogue system** - Portrait + text box, choices when relevant
- **Quest journal** - Organized, clear objectives

---

## 🎵 Audio Design

### Music
- **Orchestral with Mediterranean instruments** (lyres, flutes)
- **Dynamic combat music** - intensifies with danger
- **Atmospheric exploration** - mysterious, epic
- **Emotional story themes** - for key narrative moments

### Sound Effects
- **Impactful combat** - satisfying hit sounds
- **Ambient world** - ocean waves, city bustle, creature calls
- **Magical sounds** - distinct for Mana vs Solar abilities

---

## 📊 Technical Scope

### Demo Deliverables
- [ ] 1 playable class (pick one to start, then expand)
- [ ] Central Atlantis city area (3-4 districts)
- [ ] Outdoor exploration zone
- [ ] 1 dungeon/cave
- [ ] 3-5 enemy types
- [ ] Basic combat system
- [ ] Character progression (levels 1-10)
- [ ] 2-3 quests
- [ ] 1-2 hours gameplay

### Full Game Vision
- 6+ playable classes
- 20+ hours gameplay
- Multiple cities and biomes
- 15+ enemy types + bosses
- Deep story with multiple endings
- Advanced class evolutions

---

## 🎯 Success Metrics

### For Demo
- **Fun combat** - Feels responsive and rewarding
- **Intriguing world** - Players want to explore more
- **Clear identity** - Atlantean theme comes through
- **Technical stability** - No major bugs
- **Replayability** - Different classes feel distinct

### For Full Game
- Positive reviews focusing on story/atmosphere
- Strong word-of-mouth
- Completion rate >40%
- Multiple playthroughs from players

---

## 📅 Development Phases

### Phase 1: Foundation (Current)
- Game design documentation
- Godot project setup
- Core movement & combat prototype
- Basic enemy AI

### Phase 2: Demo Development
- City environment art
- One playable class fully implemented
- Combat refinement
- First quest chain

### Phase 3: Demo Polish
- UI/UX implementation
- Audio integration
- Bug fixing
- Playtesting

### Phase 4+: Full Game Expansion
- Additional classes
- More zones
- Full story implementation
- Advanced features

---

## 🤝 Team & Roles

**Current:** Solo development / Small team
**Needed Skills:**
- Game design & programming (Godot/GDScript)
- 2D art (sprites, tiles, UI)
- Writing (story, dialogue)
- Audio (music, SFX)
- Playtesting

---

## 📝 Open Questions

1. **Hero's name and background?**
2. **Specific motivation for the journey?**
3. **Which class to prototype first?**
4. **Tone balance:** How dark/hopeful despite doomed setting?
5. **Flood timeline:** Does player know from start? Hidden knowledge?
6. **Companion system:** Solo forever, or potential party members later?

---

**Document Version:** 1.0
**Last Updated:** 2026-01-04
**Status:** Initial Draft
