# Simple FX: Smoke Patches — attribution

A 1.6 port of **Simple FX: Smoke Patches**, by **MysticFelines**
([2819074837](https://steamcommunity.com/sharedfiles/filedetails/?id=2819074837)).

## Status: public

The source mod is **dead** — `<supportedVersions>` reads 1.3, 1.4, 1.5 and stops — and **no
licence is declared anywhere**, checked at the four places one could be:

- no `LICENSE` file in the mod: the whole thing is `About/` plus `Patches/`, eight files;
- nothing in `About.xml` beyond name, author, packageId, versions, description, `loadAfter` and
  `modDependencies`;
- no linked repository — `<url>` is absent entirely;
- nothing in the body of the description on its Steam page.

That last check is the one that matters. It is the one that was skipped once on たたら製鉄, whose
ban on redistribution turned out to be a sentence in its description and nowhere else.

This is the usual convention for ports on the RimWorld Workshop: republished with **credit by
name** and **removal on request, without argument**. The `<author>` field reads
`MysticFelines - 1.6 adapted by Nelim`, and the removal clause is in the description.

The mod is XML only — six patch files, no assembly, nothing decompiled.

## What the mod is

**Simple FX: Smoke** draws smoke, heavy smoke and steam over fires, stoves and generators. It
ships patches for the base game and for Coal Expanded, Trade Ships, the Tribal Signal Fire and
part of the Vanilla Expanded series.

Two Workshop items carry it, and only one of them can load in 1.6:

| item | title | created by | versions |
|---|---|---|---|
| [2574489704](https://steamcommunity.com/sharedfiles/filedetails/?id=2574489704) | Simple FX: Smoke | **Owlchemist and Mlie** | 1.3, 1.4 — last updated 23 March 2023 |
| [3261314247](https://steamcommunity.com/sharedfiles/filedetails/?id=3261314247) | Simple FX: Smoke **Continued** | **FerrisCG** | 1.3, 1.4, 1.5, **1.6** — 19 June 2025 |

The dependency in `About.xml` names the second, and its `displayName` reads *Simple FX: Smoke
Continued* so that the button in RimWorld's missing-dependency dialog matches the title of the
page it opens. The `packageId` is the same in both, `Owlchemist.SimpleFX.Smoke2`: FerrisCG's
continuation is a drop-in replacement, not a fork under a new id.

**Getting that credit right took reading the Steam page, and the first attempt got it wrong.**
This document said "maintained by Mlie" until 2026-09-06, because the continuation's own
`About.xml` still reads `<name>Simple FX: Smoke</name>` and `<author>Owlchemist, Mlie</author>` —
FerrisCG did not add themselves to it, and their name appears **nowhere in the mod's files**. It
is in the "Created by" block of the Workshop page and nowhere else. Mlie is a co-author of the
original, not the person who carried it into 1.6.

The lesson generalises: for a continuation, the `<author>` field records who wrote the mod and
the Workshop page records who is keeping it alive. Credit needs both, and only one of them is on
disk.

This adds the buildings it does not reach. Both mods' patch files were read and every `defName`
they target extracted: **34 in the living mod against MysticFelines' 26, no overlap at all**, and
no intersection either with the 20 this port ships. It is an extension of that mod, not a rival to
it, and it is useless without it.

Simple FX: Smoke is **alive**: it declares 1.6 and ships `1.6/Assemblies/simplefxsmoke.dll`.
Nothing in this port belongs in it — the two mods do not touch the same buildings.

## What was carried over

MysticFelines' choice of buildings and every one of their particle values: sizes, fleck defs,
per-rotation offsets, and which buildings smoke only while a bill is running. **One field on three
of twenty operations was changed; every other value is exactly as they left it.** The whole of
this mod is that judgement; the port is the work of finding out which of those buildings still
exist.

The three are `VFEM2_HearthDarklight`, `VFEC_WoodFiredCrematorium` and `Stone_DarklightCampfire`,
each gaining an `indoorAlt` of `Owl_SmokeIndoors` — see below. They are recorded here rather than
buried because "nothing was retuned" is the kind of claim that has to stay true to be worth
making.

Two cosmetic normalisations, both no-ops for RimWorld's `Vector3` parser, which reads each
component with `float.Parse` in the invariant culture: `(.2,0,0.1)` written as `(0.2,0,0.1)`, and
`(0,0,.25)` as `(0,0,0.25)`. And the indentation, which in the source drifted between two and
seven tabs on sibling elements of the same operation.

## What changed in the port

### The comp did not change, and that had to be checked

Simple FX: Smoke renamed its assembly between 1.3 and 1.4: `Flecker.dll` became
`simplefxsmoke.dll`. That is the kind of rename that usually takes a namespace with it and
silently kills every patch written against the old name.

It did not here. `Source/CompProperties_Smoker.cs` in the 1.6 build still declares
`namespace Flecker`, and the mod's own `Patches/patch.owlchemist.simplefx.smoke2.xml` — which
sits at the mod root with no `LoadFolders.xml`, so it is the file 1.6 loads — still writes
`Class="Flecker.CompProperties_Smoker"`. The class name in all six files here is correct as
MysticFelines wrote it.

Every field used was checked against that same source file. `billsOnly`, `particleSize`,
`fleckDef`, `indoorAlt`, `particleOffset` and the four per-rotation offsets all still exist; so
do the fleck defs referenced, `Owl_Vapor`, `Owl_SmokeHeavy` and `Owl_SmokeIndoors`, in
`Defs/owlchemist.simplefx.smoke2.xml`.

### Three target mods cannot load in 1.6

| mod | packageId | state |
|---|---|---|
| Vanilla Factions Expanded - Ancients | `VanillaExpanded.VFEA` | last update 27 May 2025, Workshop tags 1.3/1.4/1.5, no `1.6` folder |
| Vanilla Factions Expanded - Medieval | `OskarPotocki.VanillaFactionsExpanded.MedievalModule` | Workshop title now reads **[1.4] Vanilla Factions Expanded - Medieval** |
| Vanilla Expanded - Royalty Patches | `OskarPotocki.VanillaExpanded.RoyaltyPatches` | last update 8 March 2024, tags stop at 1.4 |

Vanilla Factions Expanded - Vikings, which the Royalty and Ideology patch mods extended, is in
the same state: **[1.4] Vanilla Factions Expanded - Vikings**. The Vanilla Expanded team marks a
retired module by putting its last version in front of the title, which is a clearer signal than
`supportedVersions` and worth reading before anything else.

Seven targets go with them:

| dropped | was in |
|---|---|
| `VFEA_AncientChemfuelPoweredGenerator` | VFE Ancients |
| `VFEA_FueledMendingStation` | VFE Ancients |
| `VFEM_Candle` | VFE Medieval |
| `VFEM_WallTorchLamp` | VFE Medieval |
| `VFEM_DarkCandle` | VE Ideology Patches, on VFE Medieval |
| `VFEM_WallTorchDarkLamp` | VE Ideology Patches, on VFE Medieval |
| `VVFEM_DarkCandle` | never existed — see below |

Medieval 2's furniture was read rather than searched by name, to be sure the candle and the wall
torch had not simply been renamed: the only lit buildings it defines are `VFEM2_Hearth` and
`VFEM2_HearthDarklight`. There is no candle and no wall torch in it.

### One retarget

`VFEV_DarkHearth` — the Ideology twin of the Vikings hearth, defined by VE Ideology Patches — is
now **`VFEM2_HearthDarklight`** in Vanilla Factions Expanded - Medieval 2, with the same
refuelable, glower, heat pusher and darklight-overlay comps. The operation follows it, with
MysticFelines' `particleSize` of 1.5 unchanged.

It sits behind Medieval 2's `1.6/Mods/Ideology` load folder, so a player with Medieval 2 and no
Ideology does not have the def. The conditional guard covers that without needing to know it.

### One building added, and it is the only thing here that is not MysticFelines'

`VFEM2_Hearth`, the plain hearth, is **new coverage** — the single place this mod goes past the
list it was ported from. The reason is a gap on the other side: Simple FX: Smoke still patches
`VFEV_Hearth`, the Vikings hearth, which cannot exist in 1.6, and it did not follow the building
into Medieval 2 the way this port followed its darklight twin. Left alone, a Medieval 2 player
with Ideology would see one hearth smoke and the identical one beside it not.

The values are **Owlchemist's**, lifted from Simple FX: Smoke's own `AddSmokeVE.xml` operation for
`VFEV_Hearth` — `particleSize` 1.5 and `indoorAlt` `Owl_SmokeIndoors` — rather than invented.

Should Simple FX: Smoke ever repair its own Vikings patch by following it to Medieval 2, this
operation removes itself — see below.

### The three values changed: one `indoorAlt`, three times

`indoorAlt` names the fleck to use when the building is indoors. Without it, a building keeps its
heavy outdoor smoke inside a room.

Tabulating the twenty operations shows the rule MysticFelines follows everywhere else: `indoorAlt`
goes with the default heavy `Smoke` fleck, and is left off wherever `fleckDef` is already
`Owl_Vapor`, which needs no lighter indoor variant. Exactly three operations broke that rule, and
all three now carry `Owl_SmokeIndoors`:

| operation | why | evidence |
|---|---|---|
| `VFEM2_HearthDarklight` | the plain `VFEM2_Hearth` beside it has one, and they are one building in two variants | Owlchemist set `indoorAlt` on the same building as `VFEV_Hearth`; MysticFelines' own `DarklightBrazier` carries one |
| `Stone_DarklightCampfire` | same case, and the clearest | its plain twin `Stone_Campfire` is patched by Simple FX: Smoke with the *same* `particleSize` 1.5 **and** `indoorAlt`; so is vanilla's `Campfire` |
| `VFEC_WoodFiredCrematorium` | the weakest of the three | Simple FX: Smoke's `ElectricCrematorium` has exactly this shape — `billsOnly`, `particleSize` 1 — and carries `indoorAlt`, as does this mod's own `CA_ChemfuelCrematorium`. But upstream's `CoalCrematorium` has none, so the precedent is 2–1, not unanimous |

Three more operations sit outside that rule and are **right** to, which is why they were left
alone:

- **`BurnPit`** — heavy fleck, no `indoorAlt`. A burn pit is an outdoor building; there is nothing
  indoors to switch to.
- **`VFEC_HeatStones`** — sets `Owl_SmokeIndoors` as its main `fleckDef`. The indoor form is the
  only form it ever uses, so an alternate would have nothing to do.
- **`CA_ChemfuelTurbine`** — uses `Owl_SmokeHeavy`, whose indoor twin is `Owl_SmokeHeavyIndoors`,
  not `Owl_SmokeIndoors`. Simple FX: Smoke pairs exactly those two on its own `WoodFiredGenerator`,
  so this **is** a real fourth candidate — but it takes a different value from the three above,
  it was not part of what was asked for, and guessing at it is the thing this port has refused
  everywhere else. It is named here so the choice is visible rather than forgotten.

None of this is a judgement about how the smoke *should* look — it is the one MysticFelines
already made, applied to the three buildings where she had applied it inconsistently. The values
themselves are hers and Owlchemist's; the only thing added is the field, and always the same one.

### One operation that had never fired

The source's Medieval section had two operations for the dark candle. The second read:

```xml
<Operation Class="PatchOperationConditional">
  <xpath>/Defs/ThingDef[defName="VVFEM_DarkCandle"]</xpath>
  <match Class="PatchOperationAdd">
    <xpath>/Defs/ThingDef[defName="VFEM_DarkCandle"]/comps</xpath>
```

Two Vs in the test, one in the target. `PatchOperationConditional` runs `<match>` only when its
own xpath matches something, so this had done nothing since the day it was written — and done it
quietly, because a conditional that does not match is a success, not a failure. It is moot in
1.6, since `VFEM_DarkCandle` is gone either way, but it was dead on arrival rather than killed by
the version.

### One comment that named the wrong mod

`Stone_DarklightCampfire` was filed under `<!-- VE Ideology Patches + VFE Core -->`. It is
neither: it is **Vanilla Furniture Expanded**'s own dark firepit, in
`1.6/Mods/Ideology/Defs/Buildings_Furniture/Buildings_Ideology.xml`, which its `loadfolders.xml`
loads with `IfModActive="Ludeon.RimWorld.Ideology"`. That mod is alive and the def is unchanged,
so the operation itself stands — only the comment was wrong, and a wrong comment is what sends
the next reader to check the wrong mod's status.

The `SimpleUtilitiesWall` file carried an `<!-- Ideology -->` comment over the fencepost torch
for the same reason: copied from the file beside it. Dropped.

### The guards were already right

The memory this port started from says to prefer `MayRequire` with a `packageId` over
`PatchOperationFindMod`, which compares a mod's **display name** and fails silently on a
mismatch. That does not apply here: **there is no `PatchOperationFindMod` in this mod.** Every
one of the twenty-six operations is a `PatchOperationConditional` testing that the target
`ThingDef` exists, and that is a better guard than either, for three reasons found while
verifying the targets:

- **A packageId does not predict the def.** `CA_ChemfuelStoveLarge` and `CE_FueledSmithyLarge`
  are Appliances Expanded defs, but they live in its `1.6/VFE_Production` folder and exist only
  when Vanilla Furniture Expanded - Production is installed too. `Stone_DarklightCampfire` needs
  Vanilla Furniture Expanded *and* Ideology; `VFEM2_HearthDarklight` needs Medieval 2 *and*
  Ideology. A `MayRequire` naming one packageId would be wrong for four of the nineteen
  operations, and wrong in the direction that fails loudly.
- **`MayRequire` is ignored on a top-level `<Operation>`.** It is honoured on list elements only,
  so using it means wrapping operations in a `PatchOperationSequence` — and a sequence returns on
  its first failing child rather than skipping it, so one dead `defName` would silence every
  operation after it. That trade is not worth making here.
- **It survives a rename.** If a target mod renames a building in a future update, the
  conditional stops matching and the patch skips. A packageId guard would still fire, and the
  `PatchOperationAdd` inside it would fail on an xpath that matches nothing.

### The guard against being absorbed later

Every conditional carries a second predicate:

```
/Defs/ThingDef[defName="X"][not(comps/li[@Class="Flecker.CompProperties_Smoker"])]
```

A `defName` test cannot detect an overlap with Simple FX: Smoke, because when both mods patch the
same building the def exists either way — the result is two `CompProperties_Smoker` on one thing
and the effect drawn twice. This predicate asks the question that actually matters: *has the comp
already been put there?*

It works because patches are applied in mod load order and this mod declares `loadAfter` on
`Owlchemist.SimpleFX.Smoke2`, so that mod's `PatchOperationAdd` has already inserted its `<li>`
into the document when these operations are evaluated. A player who forces the opposite order in
`ModsConfig.xml` gets the behaviour there was before the guard existed — it can never make things
worse than not having it.

Nothing overlaps today. Both mods' patch files were read and their targets compared: 40 `defName`s
cited by Simple FX: Smoke against the 20 here, no intersection. Its 34 xpaths were also read one
by one to rule out a broad selector catching these buildings without naming them — all are of the
form `ThingDef[defName="X"]/comps`, none selects by attribute, category or wildcard.

The guard was tested rather than assumed. Every xpath in this mod — the conditional's and the
`PatchOperationAdd`'s, forty in all — was replayed against a synthetic `<Defs>` document assembled
from the real 1.6 def files of every target mod plus the game's own Royalty and Ideology data. In
the normal state all 20 operations select exactly one def and exactly one `<comps>` node. Injecting
a `Flecker.CompProperties_Smoker` into one target, as Simple FX: Smoke's own patch would, drops it
to 19: the absorbed operation removes itself and the other nineteen are untouched. Run twice, on
`VFEM2_Hearth` and on `Stone_DarklightCampfire`.

Every target was also checked to carry a `<comps>` element in its own XML, since
`PatchOperationAdd` appends to a node that must already exist and patches run before inheritance
resolves. The three base-game defs — `Darktorch`, `DarktorchFungus`, `DarklightBrazier` — carry
`<comps Inherit="False">`, which the xpath matches: an xpath step names the element and does not
look at its attributes.

### One target that could not be verified against a 1.6 build

**Helixien Gas Brazier** (`CiXwOw.HelixienBrazier`) looked dead and is not. Its GitHub
repository, [CiXwOw/HelixienBrazier](https://github.com/CiXwOw/HelixienBrazier), stops at a `1.5`
folder and was last pushed in October 2024. Its Workshop item,
[2770815124](https://steamcommunity.com/sharedfiles/filedetails/?id=2770815124), carries the
**1.6** tag and was last updated on 30 August 2025 — after 1.6 shipped. The Steam build is ahead
of the repository, and the repository is what is readable.

So `HelixienGasBrazier` and `HelixienGasDarklightBrazier` were read out of the 1.5 defs on
GitHub, not out of the build a player would load. It is the one place in this port where that is
true, and it is written into the patch file itself so the next reader does not have to rediscover
it. If those defs were renamed in the 1.6 update, the conditional skips.

### Dependencies

`brrainz.harmony` is dropped from `modDependencies`. It was inherited from Simple FX: Smoke,
which declares it itself; this mod is six XML files and loads no code of its own. Simple FX:
Smoke remains, repointed at the item that can actually load: the source named 2574489704,
Owlchemist and Mlie's original, which stops at 1.4, and the dependency now names 3261314247,
FerrisCG's continuation. Same `packageId` either way, so the change costs a player nothing and
gains them a link that leads somewhere useful.

`loadAfter` was rebuilt from the mods actually targeted, dropping the three that cannot load and
adding `Ludeon.RimWorld.Royalty`, `Ludeon.RimWorld.Ideology`, `VanillaExpanded.VFEProduction`,
`VanillaExpanded.VFECore` and `OskarPotocki.VFE.Medieval2`.

`incompatibleWith` now names `MysticFelines.SimpleFX.Smoke2.Patches`, so the original and this
port cannot be enabled together and add every comp twice.

## What was dropped from the published folder

- `About/PublishedFileId.txt`, for the obvious reason: it names MysticFelines' Workshop item.
- `About/Preview.png`. It is MysticFelines' own showcase image and is not ours to republish.

## Adoption

If I do not answer within a reasonable time after being contacted, anyone may freely update this
or any other of my mods, including publishing a continuation of it. All credit must be preserved.
