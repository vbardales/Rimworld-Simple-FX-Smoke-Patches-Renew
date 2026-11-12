---
mod: Simple FX: Smoke Patches Renew (unofficial)
packageId: nelim.simplefxsmokepatches
repo: Rimworld-Simple-FX-Smoke-Patches-Renew
remote: https://github.com/vbardales/Rimworld-Simple-FX-Smoke-Patches-Renew.git
visibility: public
detached: no
workflow_stage: writeTests[1.0.0]
licence: silent
licence_at: "2026-09-12: no licence at the four places one could be (files, About.xml, url, Steam description); source dead since 1.5"
upstream_mod_remotes: N/A
settings_audit: not_applicable
localization: not_applicable
translation_en: not_applicable
translation_fr: not_applicable
dependencies: declared
workshop: 3811405107
published: no
workshop_required_items: n/a, not released yet
tested_on: never
remaining:
  - "2026-11-12: unverified 4.d packageIds scpchemfuel.appliances, CiXwOw.HelixienBrazier, Owlchemist.WallUtilities not found among installed mods, cannot be checked locally"
  - "2026-11-12: unverified 7.d Pickle suite written for S1 and S5 only (Tests/Pickle, steps resolve); S2 to S4, S6 to S10, S12 and the 8 billsOnly buildings wait for a mod set and a bill step"
  - "2026-11-12: unverified 7.b 12 of 20 patch operations skipped by Check-PatchTargets (target mods not installed), proven only in game"
  - "2026-11-12: unverified never seen running"
protocols_read_sha: c32984627d179fee6df20ce79bf3a883253e2511
updated: 2026-11-12
---

# Simple FX: Smoke Patches Renew (unofficial): status

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four cannot be, and wait for whoever
holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.

Workshop item 3811405107 was prepublished as 0.1.0 (owner, 2026-11-12): item created, `About/PublishedFileId.txt` committed, junction mounted in `RimWorld/Mods/`. Version 1.0.0 is not yet released, so `published` stays `no`.

## Dependencies (2026-11-12, revision 6ca61d0)

- Required (`modDependencies`): Simple FX: Smoke Continued, `Owlchemist.SimpleFX.Smoke2`, Workshop 3261314247. The patches add its `Flecker.CompProperties_Smoker` comp: without it nothing applies.
- Optional, no hard dependency: Dubs Bad Hygiene, Appliances Expanded, Vanilla Furniture Expanded - Production, Helixien Gas Brazier, Simple Utilities: Wall, Vanilla Factions Expanded - Classical, Vanilla Factions Expanded - Medieval 2. Each operation tests that its target def exists, so a missing mod is skipped. All are in `loadAfter`, which fixes their order, so `OptionalCompat.xml` has nothing to hold (`Check-OptionalCompat.ps1`: 0 patched targets, 0 declared).
- DLC: Royalty and Ideology, in `loadAfter`; their patches are conditional on the def.
- Incompatible: `MysticFelines.SimpleFX.Smoke2.Patches` (the original mod).
- Required items on the Steam page: n/a, not released yet (AUDIT.md 4.g).

## Settings audit (2026-11-12, revision 917cf5f)

- Files read: `Mod/` holds `About/About.xml`, six patch files in `Patches/`, `ATTRIBUTION.md` and `LICENSE`. No assembly, no source, no `Defs/`, no `Languages/`; no `MainButtonDef` and no settings class anywhere.
- Inventory: the mod only adds Simple FX: Smoke's `Flecker.CompProperties_Smoker` comp to existing buildings, with the values of the original mod. Player-facing smoke options (amount, size, indoor form) belong to Simple FX: Smoke, which this mod requires, and the added comps obey them. Nothing here is configurable in a way a player would use.
- Decision: no settings. Verified absence of a settings page and of a MainButtons shortcut, so there is no empty page and no shortcut to hide.
- Result: `not_applicable`. Nothing to test in game for settings; the in-game run stays in `remaining` as `unverified`.

## Translation audit (2026-11-12, revision 442ab21)

- Inventory (6.a): the mod displays no text to the player in game. `Mod/` has no assembly, no `Keyed`, no `Defs/`, no `Languages/`; the six patches only add a particle comp (`Flecker.CompProperties_Smoker`) to existing buildings. The only texts are the About name and description, published on the Steam page, in English.
- Result: `localization`, `translation_en` and `translation_fr` are `not_applicable`: nothing to make localizable, nothing to cover, no French to agree or to review. `Check-Translations.ps1`: PASS, 0 source texts.
- ChatGPT review (6.g): `/review-translation` run, page 1 of 1, no correction recommended; nothing refused, so no `Docs/review-refusals.md`. `TRANSLATION_REVIEW.md` regenerated (revision 872683c). Review by Virginie: not due, no displayed text.

## Tests (2026-11-12, revision e4a233c)

- `TESTING.md` (7.a): 13 scenarios, one per promised behavior of the description (20 buildings in six groups, silent stand-down, no double comp, safe to add and remove).
- Offline (7.b, 7.c): `Run-OfflineChecks.ps1` 10 of 10 green, `Check-PatchGuards.ps1` 0 error, `Check-OptionalCompat.ps1` OK. No unit-test project: the mod has no code (7.e). No local script, so no row in `LOCAL_SCRIPTS.md`.
- Pickle (7.d): not written yet, see `remaining`.
