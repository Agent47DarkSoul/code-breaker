Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers. The game marks the guess
  with + and - signs

  For each number in the guess that matches number and position in the secret
  code, the mark includes a '+' sign. For each number in the guess that matches
  number but not position, the mark includes a '-' sign.

  Scenario Outline: submit guess
      Given the secret code is "<code>"
      When I guess "<guess>"
      Then the mark should be "<mark>"

  Scenarios: no matches
      | code | guess | mark |
      | 1234 | 5555  |      |

  Scenarios: 1 number correct
      | code | guess | mark |  
      | 1234 | 1555  | +    |  
      | 1234 | 5551  | -    |  

  Scenarios: 2 numbers correct
      | code | guess | mark |
      | 1234 | 1256  | ++   |
      | 1234 | 1562  | +-   |
      | 1234 | 5612  | --   |

  Scenarios: 3 numbers correct
      | code | guess | mark |  
      | 1234 | 1235  | +++  |  
      | 1234 | 1253  | ++-  |  
      | 1234 | 1523  | +--  |  
      | 1234 | 5123  | ---  |  

  Scenarios: all numbers correct
      | code | guess | mark |
      | 1234 | 1234  | ++++ |
      | 1234 | 1243  | ++-- |
      | 1234 | 1423  | +--- |
      | 1234 | 4321  | ---- |