# Testing

The mod adds Simple FX: Smoke's `Flecker.CompProperties_Smoker` comp to 20 buildings of other mods
and of the base game, through six patch files in `Mod/Patches/`. Nothing else: no code, no def, no
text. What can be proven offline is proven by the shared checks (see "Offline checks"). What the
smoke looks like can only be seen in game (see "Scenarios").

## Scenarios

All scenarios need Simple FX: Smoke Continued (`Owlchemist.SimpleFX.Smoke2`) active. Each
"building" row is a building the description promises; the expected result is smoke or steam
rising from the building while it is lit or fuelled, and none while it is cold.

| # | Preconditions | Action | Expected |
|---|---|---|---|
| S1 | Mod and Simple FX: Smoke, no other mod | Start a new colony, open the debug log | No red error from this mod, no `Flecker.CompProperties_Smoker` error |
| S2 | Dubs Bad Hygiene | Build and light a burn pit | Smoke rises from it |
| S3 | Appliances Expanded | Build and fuel the chemfuel crematorium, smelter, smithy, turbine, the wood-fired turbine and the chemfuel stove | Each one smokes while working |
| S4 | S3 plus Vanilla Furniture Expanded - Production | Build the large chemfuel stove and the large fueled smithy | Each one smokes while working |
| S5 | Royalty and Ideology | Build the darklight brazier, the darktorch and the fungus darktorch, light them | Each one smokes |
| S6 | Helixien Gas Brazier | Build both braziers, fuel them | Each one smokes |
| S7 | Simple Utilities: Wall | Build the fencepost torch lamp, light it | It smokes |
| S8 | Vanilla Factions Expanded - Classical | Build the heat stones and the wood-fired crematorium | Each one smokes while working |
| S9 | Vanilla Factions Expanded - Medieval 2 | Build the hearth; with Ideology, the darklight hearth | Each one smokes |
| S10 | Vanilla Furniture Expanded with Ideology | Build the dark firepit | It smokes |
| S11 | Mod and Simple FX: Smoke, none of the optional mods above | Start a colony | No message in the log about a missing building or mod: every operation stands down in silence |
| S12 | Any building of S2 to S10 that Simple FX: Smoke already patches itself | Check the building's comps (debug inspector) | One `Flecker.CompProperties_Smoker` comp, not two |
| S13 | A save made without the mod | Add the mod, load, then remove it and load again | Both loads succeed; the mod adds no thing and no def |

## Offline checks

Run on 2026-11-12, all green, from the protocols repository with
`powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Run-OfflineChecks.ps1 -ModRoot <mod>`:
ModBasics, Translations, XmlFields, DefRefs, TypeRefs, ConfigErrors, DefInjected, Textures,
PatchTargets and SettingsContract (10 of 10; XmlClasses skipped, no type list).
`Check-PatchGuards.ps1`: 0 error, 20 operations in 6 files. `Check-OptionalCompat.ps1`: 0 target,
0 declared.

Limit: `Check-PatchTargets` judged 20 of 20 operations but skipped 12 of them, because Appliances
Expanded, Helixien Gas Brazier, Simple Utilities: Wall, Vanilla Expanded Framework and Vanilla
Furniture Expanded - Production are not installed on the test machine. Those 12 are proven only
by scenarios S3, S4, S6, S7 and the ones of S8 to S10 that depend on them.

There is no unit-test project and none is needed: the mod has no code.
