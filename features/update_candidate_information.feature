Feature: Update candidate information
    In order to manage candidate's information
    As an AEC Commissioner Delegat
    I want to update candidate information

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
    Scenario: Update candidate information with valid information
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Edit" link
        And I fill in the following:
        | candidate[given_name]   | Bob      |
        | candidate[surname]      | Smith    |
        | candidate[divison_name] | Adelaide |
        And I select "SA" from "candidate[state]"
        And I press "Update"
        And I confirm popup
        Then I will be on the edit page of "The Greens" party
        Then I should see a list of these candidates with position:
        | given_name | surname | party_pos |
        | Sophie     | Guy     | 1         |
        | Bob        | Smith   | 2         |
        | Jane       | Bange   | 3         |
        | Patrick    | Donlad  | 4         |
        And I should see "Candidate was successfully updated."
    
    @javascript
    Scenario: Update candidate information with no first name
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Edit" link
        And I fill in the following:
        | candidate[given_name]   |          |
        | candidate[surname]      | Smith    |
        | candidate[divison_name] | Adelaide |
        And I select "SA" from "candidate[state]"
        And I press "Update"
        And I confirm popup
        Then I will be on the edit page of "Mark" "Keough" candidate of "The Greens" party
        And I should see "Candidate information was not updated:"
        And I should see "Given name can't be blank"
    
    @javascript
    Scenario: Update candidate information with no surname
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Edit" link
        And I fill in the following:
        | candidate[given_name]   | Bob      |
        | candidate[surname]      |          |
        | candidate[divison_name] | Adelaide |
        And I select "SA" from "candidate[state]"
        And I press "Update"
        And I confirm popup
        Then I will be on the edit page of "Mark" "Keough" candidate of "The Greens" party
        And I should see "Candidate information was not updated:"
        And I should see "Surname can't be blank"
    
    @javascript
    Scenario: Update candidate information with no divison name
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Edit" link
        And I fill in the following:
        | candidate[given_name]   | Bob      |
        | candidate[surname]      | Smith    |
        | candidate[divison_name] |          |
        And I select "SA" from "candidate[state]"
        And I press "Update"
        And I confirm popup
        Then I will be on the edit page of "Mark" "Keough" candidate of "The Greens" party
        And I should see "Candidate information was not updated:"
        And I should see "Divison name can't be blank"
    
    @javascript
    Scenario: Choosing now to update candidate information after clicking update button
        When I goto the show page of "The Greens" party
        And I follow "Edit Info"
        And Choosing candidate "Mark" "Keough" I follow "Edit" link
        And I fill in the following:
        | candidate[given_name]   | Bob      |
        | candidate[surname]      | Smith    |
        | candidate[divison_name] | Adelaide |
        And I select "SA" from "candidate[state]"
        And I press "Update"
        And I dismiss popup
        Then I will be on the edit page of "Mark" "Keough" candidate of "The Greens" party