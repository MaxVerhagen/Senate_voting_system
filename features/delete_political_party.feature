Feature: Delete a political party
    In order to manage political parties
    As an AEC Commissioner Delegate
    I want to delete a political party from the system

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
    Scenario: Delete a political party from it's edit details page
        Given I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I follow "Delete Party"
        And I confirm popup
        Then I will be on admin home page
        And I should see "Party was successfully destroyed."
    
    @javascript
    Scenario: Choosing not to delete a party after clicking delete button
        Given I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I follow "Delete Party"
        And I dismiss popup
        Then I will be on the edit page of "The Greens" party