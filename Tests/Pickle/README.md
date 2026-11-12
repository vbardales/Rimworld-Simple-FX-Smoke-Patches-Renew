# In-game tests of Simple FX: Smoke Patches Renew, run by Pickle

Played inside a running RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle) (`rimworks.pickle`,
Workshop 3791648678). `Mod/` is a companion mod, **Simple FX: Smoke Patches Renew - Pickle tests**, never
published: it holds the feature files. No local step: every step is from Pickle or PickleTools.
Anything provable offline is in `scripts/Run-OfflineChecks.ps1` (`TESTING.md`), not here.

| Feature | Covers (TESTING.md scenario) | Needs |
| --- | --- | --- |
| 01-loading | S1 (mod loads after Simple FX: Smoke), S5 (comp on the Ideology and Royalty buildings) | Ideology, Royalty |
| 02-smoke-capture | S5 (a lit darklight brazier smokes: a `@review` capture, to be looked at) | Ideology, Royalty, `test-colony` |
| 03-vfe-integration | S8 (comp on both Classical buildings), S9 (comp on the Medieval 2 hearth, plus a `@review` capture of it smoking) | VFE Classical, VFE Medieval 2 |

Not written yet, waiting for the mods to be installed: S2 to S4, S6, S7, S10 (Dubs Bad Hygiene id not read, Appliances Expanded, Helixien, Simple Utilities: Wall), S12 (single comp), and the
8 `billsOnly` buildings (no step works a bill). S11 and S13 are checked by hand.

| Pass | Command (via `Submit-PickleRun.ps1`) | What it establishes |
| --- | --- | --- |
| Minimal | `-DepMap wsl-deps.sans-facultatifs.map` | the mod loads beside Simple FX: Smoke and the DLC, comps present, one capture |
| Integration | `-DepMap wsl-deps.avec-integration.map` | the same beside Vanilla Factions Expanded - Classical and Medieval 2 (framework first) |

`@requires:<packageId>` skips a scenario when the package is absent and installs nothing: a skipped scenario
proves nothing, so read that 01 and 02 actually ran.
