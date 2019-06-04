Feature: Add candidate to political party
    In order to manage candidates in a political party
    As an AEC Commissioner Delegate
    I want to add new candidates to a political party

    Background: Parties and candidates are in database
        Given these parties exist:
        | name              | name_ab |
        | The Greens        | GRN     |
        And these candidates exist:
        | given_name | surname | divison_name | state | party_pos | party_id |
        | Sophie     | Guy     | Adelaide     | SA    | 0         | 1        |
        | Mark       | Keough  | Barker       | SA    | 1         | 1        |
        | Jane       | Bange   | Boothby      | SA    | 2         | 1        |
        | Patrick    | Donlad  | Hindmarsh    | SA    | 3         | 1        |

    Scenario: Add a candidate with valid information to political party
        When I goto the show page of "The Greens" party
        And I follow "Add Candidate"
        And I fill in the following:
        | candidate[given_name]   | Bob      |
        | candidate[surname]      | Smith    |
        | candidate[divison_name] | Adelaide |
        And I select "SA" from "candidate[state]"
        And I press "Add"
        Then I should see a list of these candidates with position:
        | given_name | surname | party_pos |
        | Sophie     | Guy     | 1         |
        | Mark       | Keough  | 2         |
        | Jane       | Bange   | 3         |
        | Patrick    | Donlad  | 4         |
        | Bob        | Smith   | 5         |
