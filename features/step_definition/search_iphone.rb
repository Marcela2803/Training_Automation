# frozen_string_literal: true
require 'selenium-cucumber'
require 'selenium-webdriver'
Given('I am page amazon') do
  navigate_to $app_path
end

When('I want to search {string}') do |word|
  wait_for_element_to_display(:id, 'twotabsearchtextbox', 10)
  enter_text(:id, word, 'twotabsearchtextbox')
  wait_for_element_to_display(:xpath, "//input[@tabindex='20']", 10)
  click(:xpath, "//input[@tabindex='20']")
end

And('I select the check {string}') do |check|
  wait_for_element_to_display(:xpath, "(//span[contains(.,'#{check}')])[3]", 10)
  check_checkbox(:xpath, "(//span[contains(.,'#{check}')])[3]")
end

And('Show me the results ordered by price {string}') do |ordered|
  wait_for_element_to_display(:id, 's-result-sort-select', 10)
  select_option_from_dropdown(:id, :text, ordered, 's-result-sort-select')
end
Then('Check that prices are ordered') do
  prices = $driver.find_elements(:xpath, "//span[@class='a-color-base'][contains(.,'$')]").map { |e| e.text.gsub(/[$,.]/, '').to_i }
  prices_copy = prices.sort.reverse
  expect(prices).to eq(prices_copy)
end
