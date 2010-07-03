Feature: Input

  In order to read user input
  As a developer using Cucumber
  I want to symulate user typing
  
  Scenario: Q&A
    Given a file named "welcome.rb" with:
      """
      puts "Hello! What's your name?"
      name = STDIN.gets
      puts "What's up #{name}?"
      """
    When I run "ruby welcome.rb" and type:
      """
      Stan
      """
    Then the output should contain "What's up Stan?"
    
  Scenario: multiline input
    Given a file named "sentenceize.rb" with:
      """
      input = []
      STDIN.each_line do |line|
        input << line
      end
      puts input.map{|l| l.gsub("\n","").capitalize}.join(". ") + "."
      """
    When I run "ruby sentenceize.rb" and type:
      """
      I
      love
      ruby
      """
    Then the output should contain "I. Love. Ruby."
