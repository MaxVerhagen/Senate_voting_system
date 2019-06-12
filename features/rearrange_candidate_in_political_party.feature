Feature: Rearrange candidates in political party
    In order to change candidate order in their political party
    As an AEC Commissioner Delegate
    I want to be able to drag candidate names and arrange them in right order

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
    
    Scenario: View a list of candidates by their original order
        When I goto the edit page of "The Greens" party
        Then I should see a list of these candidates:
        | given_name | surname |
        | Sophie     | Guy     |
        | Mark       | Keough  |
        | Jane       | Bange   |
        | Patrick    | Donlad  |

    @javascript
    Scenario: Rearrange candidates from displayed list by drag and drop
        When I goto the edit page of "The Greens" party
        And I drag "Patrick" "Donlad" to position 1
        Then I should see a list of these candidates:
        | given_name | surname |
        | Patrick    | Donlad  |
        | Sophie     | Guy     |
        | Mark       | Keough  |
        | Jane       | Bange   |

    @javascript
    Scenario: Rearranged positions should persist on page reload
        When I goto the edit page of "The Greens" party
        And I drag "Jane" "Bange" to position 2
        And I goto the edit page of "The Greens" party
        Then I should see a list of these candidates:
        | given_name | surname |
        | Sophie     | Guy     |
        | Jane       | Bange   |
        | Mark       | Keough  |
        | Patrick    | Donlad  |
    
    @javascript
    Scenario: Rearranged candidates should have updated position displayed
        When I goto the edit page of "The Greens" party
        And I drag "Mark" "Keough" to position 1
        When I goto the edit page of "The Greens" party
        Then I should see a list of these candidates with position:
        | given_name | surname | party_pos |
        | Mark       | Keough  | 1         |
        | Sophie     | Guy     | 2         |
        | Jane       | Bange   | 3         |
        | Patrick    | Donlad  | 4         |