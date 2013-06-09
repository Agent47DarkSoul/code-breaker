Given(/^I am not playing the game$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new(output)
  game.start
end

Then(/^I should see "(.*?)"$/) do |message|
  output.messages.should include(message)
end

class Output
  def puts(message)
    messages << message
  end

  def messages
    @messages ||= []
  end
end

def output
  @output ||= Output.new
end