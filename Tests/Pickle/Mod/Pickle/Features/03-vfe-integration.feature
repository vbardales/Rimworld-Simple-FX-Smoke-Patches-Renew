# The patches on Vanilla Factions Expanded - Classical and Medieval 2 reached their buildings.
# Both Classical buildings smoke only while a bill is worked (billsOnly): they get the comp assertion, no capture.
Feature: Simple FX: Smoke Patches Renew beside Vanilla Factions Expanded

  @requires:OskarPotocki.VFE.Classical
  @requires:nelim.pickletools.deffields
  Scenario: the Classical heat stones and wood-fired crematorium carry the smoke comp
    Then Nelim's Pickle Tools: the def "VFEC_HeatStones" of type "ThingDef" has the comp "Flecker.CompProperties_Smoker"
    And Nelim's Pickle Tools: the def "VFEC_WoodFiredCrematorium" of type "ThingDef" has the comp "Flecker.CompProperties_Smoker"

  @requires:OskarPotocki.VFE.Medieval2
  @requires:nelim.pickletools.deffields
  Scenario: the Medieval 2 hearth carries the smoke comp
    Then Nelim's Pickle Tools: the def "VFEM2_Hearth" of type "ThingDef" has the comp "Flecker.CompProperties_Smoker"

  @review
  @requires:OskarPotocki.VFE.Medieval2
  @requires:nelim.pickletools.camerazoom
  @requires:nelim.pickletools.soundcapture
  @requires:nelim.pickletools.stagedecor
  Scenario: a Medieval 2 hearth smokes
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: I place the decor "VFEM2_Hearth" near (120, 196)
    And Nelim's Pickle Tools: the decor "VFEM2_Hearth" at (120, 196) burns
    When Nelim's Pickle Tools: I frame the cells (118, 194) to (122, 198) filling 60 percent of the screen
    And Nelim's Pickle Tools: I let 6 real seconds go by
    And I take a screenshot "sfx-vfem2-hearth"
    Then no errors were logged
    When Nelim's Pickle Tools: the decor is removed
