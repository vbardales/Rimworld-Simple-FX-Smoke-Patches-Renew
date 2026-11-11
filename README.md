# Simple FX: Smoke Patches Renew (unofficial)

Port of **MysticFelines' Simple FX: Smoke Patches** to RimWorld 1.6.

**I am not the author of this mod.** The choice of buildings and their particle values are
MysticFelines' — all I did was the work needed to make it run on 1.6, and to find out which of its
patches still had something to patch. No value of theirs was altered; three operations gained one
field, named and justified in [ATTRIBUTION.md](ATTRIBUTION.md). Credit goes to them; mistakes in
the port are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2819074837 — declares 1.3,
1.4, 1.5 and stops. The page is still online; the mod is abandoned, not withdrawn. It is XML
only, so nothing here was decompiled.

## What the mod does

**Simple FX: Smoke** draws smoke, heavy smoke and steam over fires, stoves and generators. It
ships patches for the base game and for Coal Expanded, Trade Ships, the Tribal Signal Fire and
part of the Vanilla Expanded series.

The one to install is
[Simple FX: Smoke Continued](https://steamcommunity.com/sharedfiles/filedetails/?id=3261314247)
(3261314247), **FerrisCG**'s continuation, which is the only one that declares 1.6. Owlchemist
and Mlie's original ([2574489704](https://steamcommunity.com/sharedfiles/filedetails/?id=2574489704))
stops at 1.4 and was last updated in March 2023. The continuation keeps the original `packageId`,
`Owlchemist.SimpleFX.Smoke2`, so it is a drop-in replacement and this mod's dependency resolves
against either — only one of them can load here.

This adds the buildings it does not reach. Every `defName` targeted by each mod's patch files was
extracted and compared: **34 in Simple FX: Smoke against MysticFelines' 26, and no intersection
with the 20 shipped here either.** It is an extension of that mod, not a rival to it, and it is
useless without it.

| mod | buildings |
|---|---|
| Dubs Bad Hygiene | burn pit |
| Appliances Expanded | chemfuel crematorium, smelter, smithy, turbine; wood-fired turbine; chemfuel stove |
| Appliances Expanded + VFE Production | large chemfuel stove, large fueled smithy |
| Royalty | darklight brazier *(with Ideology)* |
| Ideology | darktorch, fungus darktorch |
| Helixien Gas Brazier | brazier, darklight brazier |
| Simple Utilities: Wall | fencepost torch lamp |
| Vanilla Factions Expanded - Classical | heat stones, wood-fired crematorium |
| Vanilla Factions Expanded - Medieval 2 | hearth; darklight hearth *(with Ideology)* |
| Vanilla Furniture Expanded + Ideology | dark firepit |

None of them is required. Every operation is conditioned on the building's own def existing, so a
mod you do not have is skipped in silence — and so is a building that mod has since renamed.

Each operation also carries a second condition: it stands down if Simple FX: Smoke has already
put its own comp on that building. Nothing overlaps today, checked def by def, so the guard
changes nothing now — it is there so a future update to Simple FX: Smoke cannot make the two mods
add the same effect twice. A `defName` test alone could not catch that, because the def exists
either way.

Safe to add to a save and safe to remove from one: it adds no thing and no def, only a graphical
comp to buildings that already exist.

## What changed in the 1.6 port

Short version: **the comp survived intact; a quarter of the buildings did not.**

### Simple FX: Smoke renamed its assembly but not its namespace

`Flecker.dll` in 1.3 became `simplefxsmoke.dll` in 1.4. That is normally the point at which every
patch written against the old name dies quietly. It did not here: the 1.6 build's own source
still declares `namespace Flecker`, and its own patch file still writes
`Class="Flecker.CompProperties_Smoker"`. All six files are correct as MysticFelines wrote them,
and every field they set — `billsOnly`, `particleSize`, `fleckDef`, `indoorAlt`, `particleOffset`
and the four per-rotation offsets — still exists on that class.

### Three target mods stop before 1.6

Vanilla Factions Expanded - **Ancients** was last updated in May 2025 and is tagged 1.5. Vanilla
Factions Expanded - **Medieval** and Vanilla Expanded - **Royalty Patches** (with its Ideology
sibling) are retired; the Workshop title of the Medieval one now literally begins **[1.4]**, which
is how the Vanilla Expanded team marks a module it has stopped.

Seven targets go with them: the ancient chemfuel generator and fueled mending station, the
medieval candle and wall torch lamp, their two darklight variants, and one that never existed
(below). Medieval 2's furniture was read rather than searched by name, to be sure nothing had
simply been renamed: the only lit buildings in it are the hearth and its darklight twin.

### One retarget and one building added

`VFEV_DarkHearth`, the Ideology twin of the Vikings hearth, is now Medieval 2's
`VFEM2_HearthDarklight` with the same comps. The patch follows it there.

Its plain twin, `VFEM2_Hearth`, is **new coverage** — the one place this mod goes past
MysticFelines' list. Simple FX: Smoke still patches `VFEV_Hearth`, a `defName` that cannot exist
in 1.6, and did not follow the building into Medieval 2. Left alone, a Medieval 2 player with
Ideology would see the darklight hearth smoke and the plain one not. Its values are the upstream
ones for `VFEV_Hearth`, read out of Simple FX: Smoke's own `AddSmokeVE.xml`.

### One field, added three times

`indoorAlt` names the fleck to use indoors; without it a building keeps its heavy outdoor smoke in
a room. Tabulating the twenty operations shows the rule MysticFelines follows: `indoorAlt` goes
with the default heavy fleck, and is omitted wherever `fleckDef` is already `Owl_Vapor`, which is
light enough already. Three operations broke it, and all three now carry `Owl_SmokeIndoors`:
`VFEM2_HearthDarklight`, `Stone_DarklightCampfire` and `VFEC_WoodFiredCrematorium`.

**These are the only values in the mod that are not as MysticFelines left them**, and each has a
precedent rather than a preference behind it. The darklight hearth and the dark firepit are
Ideology twins of buildings Simple FX: Smoke itself patches *with* `indoorAlt` at the same
`particleSize` — `VFEV_Hearth` and `Stone_Campfire`. The crematorium is the weakest case and is
labelled as such: two crematoria carry the field, upstream's `CoalCrematorium` does not.

Three operations sit outside the rule and are right to. `BurnPit` is an outdoor building, with
nothing indoors to switch to. `VFEC_HeatStones` already uses `Owl_SmokeIndoors` as its main fleck,
so an alternate would have nothing to do. `CA_ChemfuelTurbine` uses `Owl_SmokeHeavy`, whose indoor
twin is `Owl_SmokeHeavyIndoors` rather than `Owl_SmokeIndoors` — a real fourth candidate, taking a
different value, left alone rather than guessed at.

### One operation had never fired

The dark candle had two operations, and the second tested for `VVFEM_DarkCandle` — two Vs — while
adding to `VFEM_DarkCandle`. `PatchOperationConditional` runs its `<match>` only when its own
xpath matches, and a conditional that does not match counts as a success, so this had been silent
since the day it was written. Moot in 1.6, but worth recording as dead on arrival rather than
killed by the version.

### The guards were already the right ones

There is no `PatchOperationFindMod` in this mod to replace. Every operation is a
`PatchOperationConditional` on the target def existing, which is better than a `packageId` guard
here for a concrete reason: four of the twenty operations target defs that need *two*
mods, not one — the large stove and smithy need Appliances Expanded **and** VFE Production, the
dark firepit needs Vanilla Furniture Expanded **and** Ideology, the darklight hearth needs
Medieval 2 **and** Ideology. A `MayRequire` naming one packageId would be wrong for all four, and
wrong in the direction that fails loudly.

`MayRequire` is also ignored on a top-level `<Operation>` — it is honoured on list elements only —
so using it would mean wrapping operations in a `PatchOperationSequence`, which returns on its
first failing child instead of skipping it. One dead `defName` would then silence every operation
after it. Not a trade worth making.

### One target could not be checked against a 1.6 build

**Helixien Gas Brazier** looked dead and is not: its GitHub stops at 1.5 and was last pushed in
October 2024, while its Workshop item carries the 1.6 tag and was updated on 30 August 2025. The
Steam build is ahead of the readable one, so its two `defName`s come from the 1.5 defs. It is the
one unverified pair in the port, and it is said so in the patch file itself.

Full detail, including the wrong mod name in one of MysticFelines' comments, is in
[ATTRIBUTION.md](ATTRIBUTION.md).

## Layout

```
Mod/            published folder; the RimWorld/Mods junction points here
  About/
  Patches/      six files, one per target mod
```

There is no assembly and no `Source/`.

## Licence

MIT, for the port. See [ATTRIBUTION.md](ATTRIBUTION.md) for the source mod's status: it declares
no licence anywhere, and this is republished under the Workshop's usual convention — credit by
name, removal on request.
