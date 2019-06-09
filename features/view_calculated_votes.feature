Feature: View calculated votes
    In order to identify which candidates have been elected for senate
    As an AEC Commissioner Delegate
    I want to be able to see the calculated votes results

    Background:
        Given I have parties in the database
        And I have candidates in my party
        And Test votes are loaded

    Scenario: Display the results of the votes
        When I goto vote count page with quota 1000
        And I fill in "1000" for "_admin_vote_count_quota"
        And I press "Recalculate"
        Then I should see "Current Quota: 1000"
    
    Scenario: Load results from session cookie
        When I goto vote count page with quota 500
        And I fill in "500" for "_admin_vote_count_quota"
        And I press "Recalculate"
        And I goto vote count page with quota 500
        Then I should see "Current Quota: 500"