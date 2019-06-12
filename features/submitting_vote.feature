Feature: Submit a vote
    In order to submit my vote for counting
    As a citizen of Australia
    I want to fill in the ballot online and submit it

    Background: Parties and candidates are in database
        Given these parties exist:
        | name                       | name_ab | position | state |
        | Australian Democrats       | DEM     | 0        | SA    |
        | Australian Labor Party     | ALP     | 1        | SA    |
        | Family First Party         | FFP     | 2        | SA    |
        | Liberal Party of Australia | GRN     | 3        | SA    |
        | Marijuana (HEMP) Party     | GRN     | 4        | SA    |
        | Nick Xenophon Team         | GRN     | 5        | SA    |
        | Liberal Democrats          | GRN     | 6        | SA    |
        | The Greens                 | GRN     | 7        | SA    |

        And these candidates exist:
        | given_name | surname   | divison_name | state | party_pos | party_id |
        | Adrian     | Rivish    | Adelaide     | SA    | 0         | 3        |
        | Yvonne     | Zeppel    | Barker       | SA    | 1         | 3        |
        | Wheatcroft | Gary      | Boothby      | SA    | 2         | 3        |
        | Bob        | Jane      | Hindmarsh    | SA    | 3         | 3        |
        | Sophie     | Guy       | Adelaide     | SA    | 0         | 8        |
        | Mark       | Keough    | Barker       | SA    | 1         | 8        |
        | Jane       | Bange     | Boothby      | SA    | 2         | 8        |
        | Patrick    | Donlad    | Hindmarsh    | SA    | 3         | 8        |
        | Gary       | Oldman    | Hollywood    | SA    | 0         | 6        |
        | Tom        | Hardy     | California   | SA    | 1         | 6        |
        | Chris      | Hemsworth | Sydney       | SA    | 2         | 6        |
        | Tyrone     | Lock      | Adelaide     | SA    | 0         | 7        |
        | Luke       | Dzivinski | Mayo         | SA    | 1         | 7        |

    Scenario: Parties are displayed in order on screen
        When I goto the voting page of "SA"
        Then I should see a list of these parties for voting:
        | party_name                 |
        | Australian Democrats       |
        | Australian Labor Party     |
        | Family First Party         |
        | Liberal Party of Australia |
        | Marijuana (HEMP) Party     |
        | Nick Xenophon Team         |
        | Liberal Democrats          |
        | The Greens                 |
    
    Scenario: Submit a vote with only one box with 1 selected above the line
        When I goto the voting page of "SA"
        And I select "1" from "party[2]"
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."

    Scenario: Submit a vote with three boxes marked above the line with one box being number 1
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | party[3] | 3     |
        | party[7] | 1     |
        | party[1] | 2     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."

    Scenario: Submit a vote with all boxes makred above the line with unique numbers
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | party[3] | 4     |
        | party[7] | 1     |
        | party[1] | 2     |
        | party[2] | 3     |
        | party[6] | 8     |
        | party[4] | 5     |
        | party[8] | 7     |
        | party[5] | 6     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."
    
    Scenario: Submit a vote above the line where number that is not 1 is repeated more than once
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | party[3] | 4     |
        | party[7] | 1     |
        | party[1] | 2     |
        | party[2] | 4     |
        | party[6] | 4     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."
    
    Scenario: Submit a vote above the line where a number that is not 1 is skipped
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | party[3] | 4     |
        | party[7] | 1     |
        | party[1] | 2     |
        | party[2] | 6     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."
    
    Scenario: Submit a vote above the line where the number 1 is repeated more than once
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | party[3] | 3     |
        | party[7] | 1     |
        | party[1] | 2     |
        | party[2] | 1     |
        And I press "Submit"
        Then I will be on voting page of "SA"
        And I should see "Your vote was unsuccessful:"
        And I should see "You are voting above the line and you have entered number 1 more than once."

    Scenario: Submit a vote above the line where the number 1 is skipped
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | party[3] | 3     |
        | party[1] | 2     |
        And I press "Submit"
        Then I will be on voting page of "SA"
        And I should see "Your vote was unsuccessful:"
        And I should see "You are voting above the line and need to number at least six boxes from 1 to 6."

    Scenario: Submit a vote below the line where the boxes are only numbered 1 - 6
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | candidate[3] | 4     |
        | candidate[7] | 1     |
        | candidate[4] | 5     |
        | candidate[1] | 2     |
        | candidate[2] | 6     |
        | candidate[8] | 3     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."
    
    Scenario: Submit a vote below the line where all the boxes are numbered
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | candidate[3] | 4     |
        | candidate[7] | 1     |
        | candidate[1] | 2     |
        | candidate[2] | 3     |
        | candidate[6] | 8     |
        | candidate[4] | 5     |
        | candidate[8] | 7     |
        | candidate[5] | 6     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."

    Scenario: Submit a vote below the line where a number that is not 1 - 6 is repeated more than once
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | candidate[3] | 4     |
        | candidate[7] | 1     |
        | candidate[1] | 2     |
        | candidate[2] | 3     |
        | candidate[6] | 7     |
        | candidate[4] | 5     |
        | candidate[8] | 7     |
        | candidate[5] | 6     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."

    Scenario: Submit a vote below the line where a number that is not 1 - 6 is skipped
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | candidate[3] | 4     |
        | candidate[7] | 1     |
        | candidate[1] | 2     |
        | candidate[2] | 3     |
        | candidate[6] | 8     |
        | candidate[4] | 5     |
        | candidate[5] | 6     |
        And I press "Submit"
        Then I will be on the thank you page
        And I should see "Your vote was successfully saved."

    Scenario: Submit a vote below the line where boxes are not numbered 1 - 6
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | candidate[3] | 4     |
        | candidate[7] | 1     |
        | candidate[1] | 2     |
        And I press "Submit"
        Then I will be on voting page of "SA"
        And I should see "Your vote was unsuccessful:"
        And I should see "You are voting below the line and need to number at least twelve boxes from 1 to 12."

    Scenario: Submit a vote below the line where the a number from 1 - 6 is repeated more than once
        When I goto the voting page of "SA"
        And I select these values for these boxes:
        | candidate[3] | 4     |
        | candidate[7] | 1     |
        | candidate[1] | 4     |
        | candidate[2] | 3     |
        | candidate[6] | 2     |
        | candidate[4] | 5     |
        | candidate[8] | 6     |
        | candidate[5] | 6     |
        And I press "Submit"
        Then I will be on voting page of "SA"
        And I should see "Your vote was unsuccessful:"
        And I should see "You are voting below the line and you have entered number 4 more than once."

    Scenario: Submit a vote with no boxes marked
        When I goto the voting page of "SA"
        And I press "Submit"
        Then I will be on voting page of "SA"
        And I should see "Your vote was unsuccessful:"
        And I should see "No boxes have been numbered."