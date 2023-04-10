# Massa Autostaking Tool (MAT)
Massa Autostaking Tool (MAT) is a tool that monitors your staking address balance at a predefined intervals and automatically buys rolls if you have sufficent balance.


# Instructions

## Build from source
- Clone this repository
- Navigate to the project root directory and run the following command
``` dart compile exe bin/autostake.dart -o bin/mat ```
- Modify the config.yaml according
- Copy both the compiled binary and the config into your server.
- Change the binary to executable mode by running this command
``` sudo chmod +x mat ```
- Start the service by running the binary

## Use compiled binary
- Get compiled binary for your OS from the latest release
- Modify the config.yaml according
- Change the binary to executable mode 
- Start the service by running the binary