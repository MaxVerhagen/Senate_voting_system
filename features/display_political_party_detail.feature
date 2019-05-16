Feature: Display political party detail
    In order to manage and view detail of a political party
    As a AEC Commissioner Delegate
    I want to view all available information on a political party

    Background: Parties and candidates are in database
        Given these parties exist:
        | name              | name_ab |
        | The Greens        | GRN     |
        | Liberal Democrats | LD      |
        And these candidates exist:
        | given_name | surname | divison_name | state | party_pos | party_id |
        | Sophie     | Guy     | Adelaide     | SA    | 1         | 1        |
        | Mark       | Keough  | Barker       | SA    | 2         | 1        |
        | Jane       | Bange   | Boothby      | SA    | 3         | 1        |
        | Patrick    | Donlad  | Hindmarsh    | SA    | 4         | 1        |
    
    Scenario: View a list of all candidates in party
        When I goto the show page of "The Greens" party
        Then I should see a list of these candidates:
        | given_name | surname |
        | Sophie     | Guy     |
        | Mark       | Keough  |
        | Jane       | Bange   |
        | Patrick    | Donlad  |