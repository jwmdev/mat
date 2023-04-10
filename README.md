# Massa Autostaking Tool (MAT)
Massa Autostaking Tool (MAT) is a tool that monitor your staking address and auto stake the received reward.


# Instructions

## Compile
- Clone the repository
- Navigate to the project root directory and run the following command
``` dart compile exe bin/autostake.dart -o bin/mat ```
- Modify the config.yaml according
- Copy both the compiled binary and the config into your server.
- Change the binary to executable mode by running this command
``` sudo chmod +x mat ```
- Start the service by running the binary
