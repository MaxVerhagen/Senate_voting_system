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
        | Sophie     | Guy     | Adelaide     | SA    | 1         | 1        |
        | Mark       | Keough  | Barker       | SA    | 2         | 1        |
        | Jane       | Bange   | Boothby      | SA    | 3         | 1        |
        | Patrick    | Donlad  | Hindmarsh    | SA    | 4         | 1        |
    
    Scenario: View a list of candidates by their original order
        When I goto the show page of "The Greens" party
        Then I should see a list of these candidates:
        | given_name | surname |
        | Sophie     | Guy     |
        | Mark       | Keough  |
        | Jane       | Bange   |
        | Patrick    | Donlad  |

    Scenario: Rearrange candidates from displayed list by drag and drop
        When I goto the show page of "The Greens" party
        And I rearrange "Patrick" "Donald" to position "1"
        Then I should see a list of these candidates:
        | given_name | surname |
        | Sophie     | Guy     |
        | Mark       | Keough  |
        | Jane       | Bange   |
        | Patrick    | Donlad  |

    Scenario: Rearranged positions should persist and new candidate order should be displayed
        When I goto the show page of "The Greens" party
        And I rearrange "Patrick" "Donald" to position "1"
        And I goto the show page of "The Greens" party
        Then I should see a list of these candidates:
        | given_name | surname |
        | Sophie     | Guy     |
        | Mark       | Keough  |
        | Jane       | Bange   |
        | Patrick    | Donlad  |