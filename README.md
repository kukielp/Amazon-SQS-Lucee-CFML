
# Producing And Consuming Amazon SQS Messages In Lucee CFML 5.3.8.201

Just some experimentation with the Amazon SQS (Simple Queue Service) using the Java SDK in Lucee CFML 5.3.8.201.

## Running Lucee CFML Locally

I built this using [CommandBox][command-box]. To start the server, I ran this from the root directory of this repository:

```sh
# Boot-up the CommandBox CLI.
box

# Start of the Lucee CFML server for this repository.
server start

# Copy the Lucee configuration into the current server context
# (mainly to set up the Admin password as "password").
cfconfig import ./.cfconfig.json
```

Each of my explorations has its own queue. The Amazon Access ID, Secret Key, and Queue Name are stored in `config.json` files; however, those are not committed to the repository for security reasons. There are, however, `config.template.json` files to see the expected data structure.

## Added Ability to use docker and deply and run on AWS App Runner
Ensure you have installed [Docker](https://www.docker.com/)

