Feature: Saving the output
  Scenario: All passes
    When I run `insanity -i 2 "echo 'Hi'" -o ./all-passes`
    Then the following files should exist:
    | all-passes/i0-exit0.txt |
    | all-passes/i1-exit0.txt |
    And the file "all-passes/i0-exit0.txt" should contain:
    """
    Hi
    """
  Scenario: All failures
    When I run `insanity -i 2 "echo 'Oops' && exit 66" -o ./all-failures`
    Then the following files should exist:
    | all-failures/i0-exit66.txt |
    | all-failures/i1-exit66.txt |
    And the file "all-failures/i0-exit66.txt" should contain:
    """
    Oops
    """
