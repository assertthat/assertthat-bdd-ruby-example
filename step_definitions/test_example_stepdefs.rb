Given(/^I add some meaningful step definishions instead of this dummy one$/) do 
    stepDefsCreated = true
    assert_true(stepDefsCreated)
end

When(/^I run the framework with mvn integration-test goal$/) do
    testsRun = true
    assert_true(testsRun)
end

Then(/^I see cucumber test report on AssertThat reporting dashboard$/) do
    reportSubmitted = true
    assert_true(reportSubmitted)
end