# The mod is in place and its patches reached the buildings of the base game and its DLC.
# No save needed for the first scenario, it runs at the main menu.
Feature: Simple FX: Smoke Patches Renew loads and patches

  Scenario: the mod loads after Simple FX: Smoke
    Then mod "nelim.simplefxsmokepatches" is loaded
    And mod "nelim.simplefxsmokepatches" loads after "Owlchemist.SimpleFX.Smoke2"

  @requires:ludeon.rimworld.ideology
  @requires:nelim.pickletools.deffields
  Scenario: the Ideology buildings carry the smoke comp
    Then Nelim's Pickle Tools: the def "Darktorch" of type "ThingDef" has the comp "Flecker.CompProperties_Smoker"
    And Nelim's Pickle Tools: the def "DarktorchFungus" of type "ThingDef" has the comp "Flecker.CompProperties_Smoker"

  @requires:ludeon.rimworld.ideology
  @requires:nelim.pickletools.deffields
  @requires:ludeon.rimworld.royalty
  Scenario: the darklight brazier carries the smoke comp
    Then Nelim's Pickle Tools: the def "DarklightBrazier" of type "ThingDef" has the comp "Flecker.CompProperties_Smoker"
