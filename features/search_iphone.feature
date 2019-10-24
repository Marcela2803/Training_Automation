Feature: Search iphone case
Scenario: I want to search iphone case in amazon, and filtrer to price and polycarbonate
Given I am page amazon
When I want to search "iphone case"
And I select the check "Polycarbonate"
And Show me the results ordered by price "Price: High to Low"
Then Check that prices are ordered