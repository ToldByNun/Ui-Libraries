<div align="center">

# ✦ UI Libraries Collection ✦

Custom UI libraries  
built for clarity, control and clean visuals

Minimal APIs · Predictable behavior · No bloat

</div>

---

## ✧ Overview

This repository contains a collection of UI libraries written from scratch.  
Each library explores different ideas around layout, animation and interaction.

The goal is not quantity — but **well-designed, readable and reusable UI code**.

---

## ✔ Finished Libraries

---

### PastOwl UI Port  
_Last update: 2026-01-17_

**Status:** Early Release  
More features will be added soon.

<p align="center">
  <img src="assets/unnamed.gif" width="820">
</p>

A lightweight UI with fast creation times and reduced visual noise.  
Inspired by older cheat-style layouts — fully reimplemented.

**Example**
```lua
local UILibrary = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/ToldByNun/Ui-Libraries/refs/heads/main/unnamed.lua"
))()

local window = UILibrary:CreateWindow("UI NAME", "Version") -- Create a new window

local categoryOne = window:CreateCategory("CATEGORY ONE") -- Create a new category
local tabOne = categoryOne:CreateTab("Tab One") -- Create a new tab within thaht category

local sectionOne = tabOne:CreateSection("SECTION #1") -- Create a new section within that tab

local checkbox = sectionOne:CreateCheckbox(
	"Checkbox", -- Label
	true, -- Default value
	function(state)
		print("Checkbox state changed to:", state)
	end -- Callback function
)

-- Visual Seperator. Doesn't have any functions and is purely for visuals.
sectionOne:CreateSeperator()

sectionOne:CreateSlider(
	"Float Slider", -- Label
	0, -- Minimum Value
	10.0, -- Maximum Value
	5, -- Default Value
	{ decimals = 2 , suffix = "F" }, -- Options: decimals, suffix
	function(v) end -- Callback function
)

sectionOne:CreateColorPicker(
	"Accent Color", -- Label
	Color3.fromRGB(255, 0, 0), -- Default Value
	function(color)
		print(color)
	end -- Callback function
)

local dropdown = sectionOne:CreateDropdown(
	"Mode", -- Label
	{ "Off", "Low", "Medium", "High", "Ultra" }, -- Options
	"Medium", -- Default Value
	function(value)
		print("Selected mode:", value)
	end -- Callback function
)
```

---

## 🧪 Work in Progress

---

### megumi.dev (private cheat) ui port
_Last update: 2026-01-23_

**Status:** Designing  
UI doesn't have any widgets designed yet, and no code is existing yet.

<p align="center">
  <img src="assets/unnamed.gif" width="820">
</p>

**Example**
_None_

---

## 🗂 Repository Structure

```text
/
├── unnamed.lua
└── README.md
```

---

## ✦ Design Philosophy

• visuals are intentional, not decorative  
• animations communicate state  
• APIs should be readable without docs  
• UI code stays UI code — no hidden logic  

---

## 📄 License

Custom license.

Commercial use is allowed.  
Redistribution or resale of the UI itself is not.

You may use this UI in paid products, games or tools,  
but you may not sell the UI library as a standalone product.

---

## Copyright (c) 2026 modulize

Permission is hereby granted to use this software for personal and commercial projects,
including products that generate revenue, provided that this software is used as part
of a larger application or system.

You may:
- Use this software in personal or commercial projects
- Modify the software for your own use
- Distribute products that include this software as a component

You may NOT:
- Sell, sublicense, or redistribute this software on its own
- Sell modified versions whose primary value is this software
- Repackage, rebrand, or resell this software as a UI library
- Claim this software as your own original work

Any redistribution must include this license.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.
