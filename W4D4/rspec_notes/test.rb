=begin 
  Lecture Outline 
  - TDD Overview 
  - Demo

  TDD Overview 
  - Why do we test? 
    - Make sure things don't break
    - Write minimal amount of code needed. 
    - Write code that is conducive to collaboration
    - A way to produce documentation
    - Also makes code more flexible
      -If it's working now.. I know what I need to add on to it to scale it up or built it up

  - What is TDD? 
    - What is the process of TDD? 
    - Red-Green-Refactor
      - Red - Write tests first, make sure they actually fail. We don't want false positives 
      - Green - Write the MINIMUM code needed to pass the test. If you don't need it, don't write it.
      - Now go back and clean up our code/update our spec to company standards, etc.
    - True 100% TDD can be rare
      - Really just depends on your company and how they handle it 

  - How do we test? 
  - What do we test?

    - E2E -> Integration -> Unit 

    - Unit testing
      - Classes or functions tested in isolation
      - i.e. Chess
      - We don't really care that a board works well with a piece.
      - If we're writing tests about pieces, we only care about the piece 
      -i.e. Board 
        - Board has board method, it is working the way I want it to.

    - Integration 
      - 5-15 % 
      - Tests how different classes interact
      - Will actually test if methods will break each other

      -i.e. Board & Piece 
        - If I have a piece class, it's working correctly with the board class.

    - E2E
      - End to end 1-5%
      - Tests flow of application
      - Tests start to finish
        i.e. If a user clicks a button, everything that follows after works 
      - More cumberson for end to end 
      - We want our Unit test to be more robus so we need less tests for End to End 

    - Everything we test should be the public aspects of our code
      - We should not be testing private/protected because they are used in our public tests. We are inherently testing them when we test our public. 

  Rspec 
    - Domain-Specific Language (DSL) written in Ruby for Ruby
    - Meta-gem that includes rspec-core, rspec-expectations, and rspec-mocks
    - Not the only Ruby testing library (others include Minitest & Cucumber)

  Rspec Demo
    - Setup
    - Structure
    - Syntax
      - describe, context
      - it
      - expect 
      - before
      - subject
      - let
  
    - Setup & Structure
      - bundle init to create Gemfile
        - gem "rspec"
        - gem "pry"
        - gem "byebug"
      - Must have separate lib & spec folders for Rspec 
        -> rspec --init
          -> will create spec folder and .rspec file
          -> .rspec
            -> Add flags
            -> --format documentation
            -> --color
        -> Have to manually create lib folder

      - In lib folder have insert_name.rb
      - In spec folder have insert_name_spec.rb 
        - on top... must require "insert_name"
        - Does not need require_relative b/c of spec_helper. It will know to get source file from lib folder
        - Also require "rspec"

    - Demo - Piece Class
      - Must write specs first
      - Must be readable and chunked appropriately.
      - Start with describe class_name do end
        - This file will be testing the Piece class

      - Notice how we run this it'll fail immediately because there isn't a Piece class
      - Before we write out the tests... we need to plan a general idea of what we're looking for. 
        - What do I need to test?
        - What am I expecting my method to do? 

      - Must write spec for initialize first before we write method


  - Review 
    - USE DOCUMENTATION. 
    - https://relishapp.com/rspec/rspec-expectations/v/3-10/docs/built-in-matchers
    - Why do we test? 
      - 

=end 