Feature: Search iphone

Scenario: I want to search iphone case in amazon, and filtrer to price and polycarbonate
#donde estoy
Given I am page amazon
#Action principal
When I want to search "iphone case"
And I select the check polycarbonate
And Show me the results ordered by price

#Result
Then Check that prices are ordered