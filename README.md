# mock-turtle-api-computer-craft

The idea here is to mock the turtle api to develop turtle code outside of computer craft minecraft.

1) first download a real lua ide here https://www.eclipse.org/ldt/
2) checkout the project into your workspace
3) run dig-managed-stairs.lua

It is an absolut basic api mock. Do not hesitate to contribute.

Important:

To run dig-managed-stairs.lua on your turtle you have to remove the following lines:
- in utils.lua
  - remove line: local turtle = require "turtle"
- in dig-managed-stairs.lua
  - remove line: local turtle = require "turtle"
