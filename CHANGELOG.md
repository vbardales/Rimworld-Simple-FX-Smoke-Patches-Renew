# Changelog

All notable changes to this mod are documented here.

## [Unreleased]

### Changed

- The mod is marked unofficial, as its source has no licence: ` (unofficial)` after the name,
  an UNOFFICIAL paragraph at the top of the description, and the same suffix in the README title.
- New mod icon and preview image.
- The description ends with a link to the source code.

No patch and no value changed: the smoke on every building is exactly what 1.0.0 gives.

## [1.0.0] — 2026-09-06

First release. Port of MysticFelines' **Simple FX: Smoke Patches** to RimWorld 1.6.

### Verified unchanged

- `Flecker.CompProperties_Smoker` is still the class Simple FX: Smoke expects. Its assembly was
  renamed from `Flecker.dll` (1.3) to `simplefxsmoke.dll` (1.4+), but the namespace went with
  neither: the 1.6 build's `Source/CompProperties_Smoker.cs` still declares `namespace Flecker`,
  and its own root `Patches/patch.owlchemist.simplefx.smoke2.xml` — the file 1.6 loads, there
  being no `LoadFolders.xml` — still writes `Class="Flecker.CompProperties_Smoker"`.
- Every field these patches set exists on that class: `billsOnly`, `particleSize`, `fleckDef`,
  `indoorAlt`, `particleOffset`, `particleOffsetEast`, `particleOffsetNorth`,
  `particleOffsetSouth`, `particleOffsetWest`. So do the fleck defs referenced — `Owl_Vapor`,
  `Owl_SmokeHeavy`, `Owl_SmokeIndoors`.
- Eighteen of the twenty-six targets, read out of the current 1.6 build of each mod concerned:
  `BurnPit`; the eight Appliances Expanded defs; `Darktorch`, `DarktorchFungus`,
  `DarklightBrazier`; `Owl_Fencepost_TorchLamp`; `Stone_DarklightCampfire`; `VFEC_HeatStones`,
  `VFEC_WoodFiredCrematorium`; and the two Helixien Gas Brazier defs, for which see below.
- Each of those targets carries a `<comps>` element in its own XML. `PatchOperationAdd` appends
  to a node that must already exist, and patches run before inheritance resolves, so a def that
  only inherits `comps` from a parent would fail. The three base-game defs carry
  `<comps Inherit="False">`; an xpath step names the element and ignores its attributes.

### Removed

- Seven targets in three mods that cannot load in 1.6.
  `VFEA_AncientChemfuelPoweredGenerator` and `VFEA_FueledMendingStation`, from Vanilla Factions
  Expanded - Ancients — last updated 27 May 2025, Workshop tags 1.3/1.4/1.5, no `1.6` folder.
  `VFEM_Candle` and `VFEM_WallTorchLamp`, from **[1.4]** Vanilla Factions Expanded - Medieval.
  `VFEM_DarkCandle` and `VFEM_WallTorchDarkLamp`, from Vanilla Expanded - Ideology Patches, whose
  Royalty sibling was last updated 8 March 2024 and stops at 1.4. And `VVFEM_DarkCandle`, below.
  Medieval 2's furniture was read rather than searched by name: it defines no candle and no wall
  torch, only `VFEM2_Hearth` and `VFEM2_HearthDarklight`.
- `brrainz.harmony` from `modDependencies`. It came from Simple FX: Smoke, which declares it
  itself; this mod is six XML files and loads no code.
- `About/PublishedFileId.txt` and `About/Preview.png`, both MysticFelines'.

### Added

- `VFEM2_Hearth`, the plain hearth in Vanilla Factions Expanded - Medieval 2. New coverage, and
  the only place this mod goes past MysticFelines' list. Simple FX: Smoke still patches
  `VFEV_Hearth`, a `defName` that cannot exist in 1.6, and did not follow the building into
  Medieval 2 the way this port followed its darklight twin — so the plain hearth smoked for
  nobody while the identical one beside it smoked here. Values are Owlchemist's, lifted from
  Simple FX: Smoke's own `AddSmokeVE.xml` operation for `VFEV_Hearth`: `particleSize` 1.5 and
  `indoorAlt` `Owl_SmokeIndoors`. The two hearths therefore differ by one field — each operation
  keeps the numbers of the author who wrote it.
- A second predicate on every conditional,
  `[not(comps/li[@Class="Flecker.CompProperties_Smoker"])]`. A `defName` test cannot see an
  overlap with Simple FX: Smoke, because when both mods patch the same building the def exists
  either way and the result is two comps and the effect drawn twice. This asks whether the comp
  is already there. It works because patches apply in mod load order and this mod declares
  `loadAfter` on `Owlchemist.SimpleFX.Smoke2`, so that mod's `<li>` is already in the document;
  a player who forces the opposite order gets exactly the old behaviour, never worse.
  Nothing overlaps today — 40 `defName`s cited by Simple FX: Smoke against the 20 here, no
  intersection, and its 34 xpaths read one by one to rule out a broad selector. The guard is for
  the future, and it was tested by injecting the comp and re-running: 19 operations apply and the
  absorbed one removes itself.

### Changed

- `VFEV_DarkHearth` → `VFEM2_HearthDarklight`. The Vikings darklight hearth was defined by
  Vanilla Expanded - Ideology Patches on **[1.4]** Vanilla Factions Expanded - Vikings; both are
  retired, and the hearth was folded into Vanilla Factions Expanded - Medieval 2 with the same
  refuelable, glower, heat pusher and darklight-overlay comps. `particleSize` unchanged at 1.5.
  It sits behind Medieval 2's Ideology load folder; the conditional guard covers that.
- **The only values in this mod that are not as MysticFelines left them**: one field,
  `<indoorAlt>Owl_SmokeIndoors</indoorAlt>`, added to three operations —
  `VFEM2_HearthDarklight`, `Stone_DarklightCampfire` and `VFEC_WoodFiredCrematorium`.
  `indoorAlt` names the fleck to use indoors; without it a building keeps its heavy outdoor smoke
  in a room. Tabulating the twenty operations shows the rule followed everywhere else —
  `indoorAlt` goes with the default heavy `Smoke` fleck and is omitted wherever `fleckDef` is
  already `Owl_Vapor`, light enough already — and these three were the only operations breaking
  it. Each has a precedent rather than a preference behind it: the darklight hearth and the dark
  firepit are Ideology twins of `VFEV_Hearth` and `Stone_Campfire`, both of which Simple FX: Smoke
  patches *with* `indoorAlt` at the same `particleSize`; the crematorium matches
  `ElectricCrematorium` upstream and `CA_ChemfuelCrematorium` here, though upstream's
  `CoalCrematorium` has none, so that one is 2–1 rather than unanimous. Three operations sit
  outside the rule and keep no `indoorAlt`, correctly: `BurnPit` is outdoors; `VFEC_HeatStones`
  already uses `Owl_SmokeIndoors` as its main `fleckDef`; and `CA_ChemfuelTurbine` uses
  `Owl_SmokeHeavy`, whose indoor twin is `Owl_SmokeHeavyIndoors` — a real fourth candidate,
  taking a different value, left alone rather than guessed at.
- Simple FX: Smoke's `steamWorkshopUrl` from 2574489704 — Owlchemist and Mlie's original item,
  tagged 1.3/1.4, last updated 23 March 2023 — to 3261314247, **Simple FX: Smoke Continued** by
  **FerrisCG**, which declares 1.6. Same `packageId` in both, `Owlchemist.SimpleFX.Smoke2`, so
  the continuation is a drop-in replacement rather than a fork. `displayName` follows the new
  item's title, so the button in the missing-dependency dialog matches the page it opens.
  FerrisCG's name is on the Workshop page only: the continuation's `About.xml` still reads
  `<author>Owlchemist, Mlie</author>`, which is how this was credited wrongly at first.
- `loadAfter` rebuilt from the mods actually targeted: the three dead ones dropped, and
  `Ludeon.RimWorld.Royalty`, `Ludeon.RimWorld.Ideology`, `VanillaExpanded.VFEProduction`,
  `VanillaExpanded.VFECore` and `OskarPotocki.VFE.Medieval2` added.
- `incompatibleWith` now names `MysticFelines.SimpleFX.Smoke2.Patches`, so the original and this
  port cannot both be enabled and add every comp twice.
- Patch files renamed after the mod each one targets, dropping the inconsistent `SFXS_` /
  `SFXSP_` prefixes.
- Two vector literals normalised — `(.2,0,0.1)` and `(0,0,.25)` written with their leading zeros.
  No behavioural change: RimWorld reads each component with `float.Parse` in the invariant
  culture, which accepts both.

### Fixed

- `VVFEM_DarkCandle` — two Vs — was the condition on the second of the two dark-candle
  operations, while its `<match>` added to `VFEM_DarkCandle`. `PatchOperationConditional` runs
  `<match>` only when its own xpath matches, and a conditional that matches nothing is a success
  rather than a failure, so this operation had done nothing, silently, since it was written. It
  is removed with the rest of the Medieval targets rather than corrected, the def it aimed at
  being gone either way.
- `Stone_DarklightCampfire` was filed under `<!-- VE Ideology Patches + VFE Core -->`. It is
  neither: it is **Vanilla Furniture Expanded**'s own dark firepit, in
  `1.6/Mods/Ideology/Defs/Buildings_Furniture/Buildings_Ideology.xml`, behind that mod's
  `IfModActive="Ludeon.RimWorld.Ideology"` load folder. The operation was right; the comment
  would have sent the next reader to check a dead mod's status instead of a live one's.
- The `<!-- Ideology -->` comment over the Simple Utilities: Wall fencepost torch, copied from
  the file beside it. Dropped.

### Not changed, and why

- The guards. There is no `PatchOperationFindMod` in this mod — every operation is a
  `PatchOperationConditional` on the target def existing, which is the better guard here.
  Four of the twenty operations target defs that need **two** mods, not one:
  `CA_ChemfuelStoveLarge` and `CE_FueledSmithyLarge` live in Appliances Expanded's
  `1.6/VFE_Production` folder, `Stone_DarklightCampfire` and `VFEM2_HearthDarklight` behind
  Ideology folders. A `MayRequire` naming one `packageId` would be wrong for all four. And
  `MayRequire` is ignored on a top-level `<Operation>` — honoured on list elements only — so
  using it means a `PatchOperationSequence`, which stops at its first failing child instead of
  skipping it.
- Every particle value. Sizes, fleck defs, per-rotation offsets and `billsOnly` are
  MysticFelines' judgement and the whole of what this mod is. The only edits are the three
  `indoorAlt` additions under **Changed**, and those apply her own rule rather than a taste of
  mine — no number was altered anywhere.

### Known limit

- The two Helixien Gas Brazier defs were read from the 1.5 defs in
  [CiXwOw/HelixienBrazier](https://github.com/CiXwOw/HelixienBrazier), not from a 1.6 build. That
  repository stops at 1.5 and was last pushed in October 2024, but the Workshop item carries the
  1.6 tag and was updated on 30 August 2025 — the Steam build is ahead of the readable one, and
  the mod is not installed here. If the braziers were renamed in that update, the conditional
  finds no def and skips.
