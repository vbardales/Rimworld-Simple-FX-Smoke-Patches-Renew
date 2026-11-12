# A lit building shows smoke. The assertion is the comp (01); this feature only captures the picture,
# which somebody must look at: a green screenshot step says a file was taken, not that smoke rises.
# Non-billsOnly buildings only. A building that smokes only while a bill is worked needs a step that does not exist yet.
Feature: Simple FX: Smoke Patches Renew smoke on a lit building

  @review
  @requires:ludeon.rimworld.ideology
  @requires:nelim.pickletools.camerazoom
  @requires:nelim.pickletools.soundcapture
  @requires:nelim.pickletools.stagedecor
  @requires:ludeon.rimworld.royalty
  Scenario: a darklight brazier smokes
    Given the save "test-colony" is loaded
    And Nelim's Pickle Tools: I place the decor "DarklightBrazier" near (120, 196)
    And Nelim's Pickle Tools: the decor "DarklightBrazier" at (120, 196) burns
    When Nelim's Pickle Tools: I frame the cells (118, 194) to (122, 198) filling 60 percent of the screen
    And Nelim's Pickle Tools: I let 6 real seconds go by
    And I take a screenshot "sfx-darklight-brazier"
    Then no errors were logged
    When Nelim's Pickle Tools: the decor is removed
