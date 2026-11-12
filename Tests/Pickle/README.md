# In-game tests of Simple FX: Smoke Patches Renew, run by Pickle

Played inside a running RimWorld by [Pickle](https://github.com/RimWorks/Rimworld-Pickle) (`rimworks.pickle`,
Workshop 3791648678). `Mod/` is a companion mod, **Simple FX: Smoke Patches Renew - Pickle tests**, never
published: it holds the feature files. No local step: every step is from Pickle or PickleTools.
Anything provable offline is in `scripts/Run-OfflineChecks.ps1` (`TESTING.md`), not here.

| Feature | Covers (TESTING.md scenario) | Needs |
| --- | --- | --- |
| 01-loading | S1 (mod loads after Simple FX: Smoke), S5 (comp on the Ideology and Royalty buildings) | Ideology, Royalty |
| 02-smoke-capture | S5 (a lit darklight brazier smokes: a `@review` capture, to be looked at) | Ideology, Royalty, `test-colony` |

Not written yet, waiting for a mod set: S2 to S4 and S6 to S10 (the optional mods), S12 (single comp), and the
8 `billsOnly` buildings (no step works a bill). S11 and S13 are checked by hand.

| Pass | Command (via `Submit-PickleRun.ps1`) | What it establishes |
| --- | --- | --- |
| Minimal | `-DepMap wsl-deps.sans-facultatifs.map` | the mod loads beside Simple FX: Smoke and the DLC, comps present, one capture |

`@requires:<packageId>` skips a scenario when the package is absent and installs nothing: a skipped scenario
proves nothing, so read that 01 and 02 actually ran.
