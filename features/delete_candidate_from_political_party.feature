Feature: Delete candidate from political party
    In order to manage candidates in a political party
    As an AEC Commissioner Delegate
    I want to delete candidates from a political party

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

    @javascript
    Scenario: Delete a candidate from political party
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Delete" link
        And I confirm popup
        Then I should see a list of these candidates with position:
        | given_name | surname | party_pos |
        | Sophie     | Guy     | 1         |
        | Jane       | Bange   | 2         |
        | Patrick    | Donlad  | 3         |
        And I should see "Mark Keough was successfully removed."
    
    @javascript
    Scenario: Choosing not to delete a candidate after clicking delete link
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Delete" link
        And I dismiss popup
        Then I should see a list of these candidates with position:
        | given_name | surname | party_pos |
        | Sophie     | Guy     | 1         |
        | Mark       | Keough  | 2         |
        | Jane       | Bange   | 3         |
        | Patrick    | Donlad  | 4         |