# ToyRobot
This the coding challenge for MyXplor
. 
There is a test suite as well as a command line binary.
Checkout the code and run the tests and binary. There are no external dependencies. The Package manifest is just there to assist the GitHub CI actions run when code is pushed.

# Tests 
The tests are probably the most informative part of the challenge as they give some insight into the process and thinking thats gone into the development of the code. To run the tests switch to the `ToyRobotTests` scheme and run tests (Command-U).

There is a `ToyRobotsTests` file which tests the acceptance criteria from the challenge docs.

# Application

To run the application from XCode you can run with a static command line. To change this go to ToyRobot -> Edit Scheme -> Run -> arguments tab.

Alternative copy the binary from `/Build/Products/Release` in your Derived data folder to any convenient place  and run it from the command line.

Example:
`./ToyRobot "PLACE 0,0,EAST MOVE MOVE MOVE MOVE MOVE MOVE MOVE LEFT MOVE MOVE REPORT PLACE 1,1, SOUTH REPORT"`

Note that the cli binary is set to release. If you would like to debug you will need to set to debug and debuggable in the scheme editor.
