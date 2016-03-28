Feature: Running the provided command
  Scenario: All passes
    When I run `insanity -i 5 "exit 0"`
    Then the stdout should contain:
    """
    .....

    5 iterations complete.

    Status 0\t| 5 times
    """
  Scenario: All failures
    When I run `insanity -i 5 "exit 1"`
    Then the stdout should contain:
    """
    .....

    5 iterations complete.

    Status 1\t| 5 times
    """
