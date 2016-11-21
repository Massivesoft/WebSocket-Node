All of the good stuff for configuring NodeJS WebSocket can be found at https://github.com/theturtle32/WebSocket-Node.

This fork is for a small edit to allow listening for multiple different socket protocols at once and handling each one differently.
Along with the edit I have added a branch that uses runit to ensure NodeJS (since it is still technically experimental) is able to recover from all crash scenarios in an instant and keep your all important websockets up and running as much as possible.
