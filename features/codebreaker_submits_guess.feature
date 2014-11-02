Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers. The game marks the guess
  with + and - signs

  For each number in the guess that matches number and position in the secret
  code, the mark includes a '+' sign. For each number in the guess that matches
  number but not position, the mark includes a '-' sign.

  Each position in the secret code can only be matched once. For example, a
  guess of '1134' against the secret code '1234' would get three '+' signs: one
  for exact matches in first, third and fourth positions. The '1' in the
  second position would be ignored

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

  Scenarios: matches with duplicates
      | code | guess | mark |
      | 1234 | 1155  | +    |
      | 1234 | 5515  | -    |
      | 1234 | 1133  | ++   |
      | 1234 | 1125  | +-   |
      | 1234 | 3345  | --   |
      | 1234 | 4234  | +++  |
      | 1234 | 2313  | ---  |
      | 1234 | 1213  | ++-  |
      | 1234 | 1115  | +    |
      | 1234 | 5111  | -    |
      | 1234 | 1114  | ++   |
      | 1234 | 4111  | --   |
      | 1134 | 1256  | +    |
      | 1134 | 2561  | -    |
      | 1134 | 1235  | ++   |
      | 1134 | 2511  | --   |
      | 1134 | 1135  | +++  |
      | 1134 | 3511  | ---  |

