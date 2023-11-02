FROM ubuntu:latest

LABEL com.github.actions.name="Build Mongoose OS firmware"
LABEL com.github.actions.description="Builds a Mongoose OS firmware for given target"
LABEL com.github.actions.icon="cpu"
LABEL com.github.actions.color="green"

LABEL repository="https://github.com/eatabit/mongoose-os-action/tree/main"
LABEL maintainer="Greg Oleksiak"

# Update system
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils build-essential sudo git

# Install mos tool dependencies
RUN sudo add-apt-repository ppa:mongoose-os/mos
RUN sudo apt-get update

# Install mos tool
RUN sudo apt-get install mos

RUN which mos
COPY mos mos

# Set entrypoint
ENTRYPOINT ["/mos"]
