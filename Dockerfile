FROM ubuntu:20.04

# Avoids interaction
ENV DEBIAN_FRONTEND=noninteractive

# Copy server files
COPY . /server
WORKDIR /server

# Make executable
RUN chmod +x ServerBuild.x86_64

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    update-ca-certificates

# Expose your FishNet portE:\Unity New Projects\Yakuza Ball Game MULTIPLAYER_clone_0\GameServer\ServerBuild
EXPOSE 2727

# Start the server
CMD ["./ServerBuild.x86_64", "-batchmode", "-nographics", "$UNITY_COMMANDLINE_ARGS"]
