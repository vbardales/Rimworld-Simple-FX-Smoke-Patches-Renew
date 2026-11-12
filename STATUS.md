---
mod: Simple FX: Smoke Patches Renew (unofficial)
packageId: nelim.simplefxsmokepatches
repo: Rimworld-Simple-FX-Smoke-Patches-Renew
remote: https://github.com/vbardales/Rimworld-Simple-FX-Smoke-Patches-Renew.git
visibility: public
detached: no
workflow_stage: declareDependencies[1.0.0]
licence: silent
licence_at: "2026-09-12: no licence at the four places one could be (files, About.xml, url, Steam description); source dead since 1.5"
upstream_mod_remotes: N/A
settings_audit: unchecked
localization: unchecked
translation_en: unchecked
translation_fr: unchecked
dependencies: declared
workshop: 3811405107
published: no
tested_on: never
remaining:
  - "2026-11-12: unverified never seen running"
protocols_read_sha: 29edd8b857cf7ee4b139cc7ac70fcb8d90c11238
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
