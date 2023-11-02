FROM ubuntu:latest

LABEL com.github.actions.name="Build Mongoose OS firmware"
LABEL com.github.actions.description="Builds a Mongoose OS firmware for given target"
LABEL com.github.actions.icon="cpu"
LABEL com.github.actions.color="green"

LABEL repository="https://github.com/eatabit/mongoose-os-action/tree/main"
LABEL maintainer="Greg Oleksiak"

# Update system
RUN apt-get update
RUN apt-get install --no-install-recommends apt-utils software-properties-common build-essential sudo git gpg-agent -y

# Install mos tool dependencies
RUN sudo add-apt-repository ppa:mongoose-os/mos -y

# Install mos tool
RUN sudo apt-get install mos-latest -y

COPY mos mos

# Set entrypoint
ENTRYPOINT ["/mos"]
