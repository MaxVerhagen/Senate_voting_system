Feature: Update party information
    In order to manage party's information
    As an AEC Commissioner Delegat
    I want to update party's information

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
    Scenario: Update party's name with valid information
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I fill in "party[name]" with "Test"
        And I press "Update Name"
        And I confirm popup
        Then I will be on the show page of "The Greens" party
        And I should see "Party was successfully updated."
        And I should see "Test"
    
    @javascript
    Scenario: Update party's name abbreviation with valid information
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I fill in "party[name_ab]" with "Test"
        And I press "Update Abv"
        And I confirm popup
        Then I will be on the show page of "The Greens" party
        And I should see "Party was successfully updated."
    
    @javascript
    Scenario: Update party's name name with invalid information
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I fill in "party[name]" with ""
        And I press "Update Name"
        And I confirm popup
        Then I will be on the edit page of "The Greens" party
        And I should see "Party information was not updated"
        And I should see "Name can't be blank"
    
    @javascript
    Scenario: Update party's name abbreviation with invalid information
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I fill in "party[name_ab]" with ""
        And I press "Update Abv"
        And I confirm popup
        Then I will be on the edit page of "The Greens" party
        And I should see "Party information was not updated"
        And I should see "Name ab can't be blank"
    
    @javascript
    Scenario: Choosing to cancle updating party's name abbreviation after clicking button
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I fill in "party[name_ab]" with "Test"
        And I press "Update Abv"
        And I dismiss popup
        Then I will be on the edit page of "The Greens" party
    
    @javascript
    Scenario: Choosing to cancle updating party's name after clicking button
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And I fill in "party[name]" with "Test"
        And I press "Update Name"
        And I dismiss popup
        Then I will be on the edit page of "The Greens" party