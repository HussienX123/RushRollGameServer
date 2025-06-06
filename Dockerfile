FROM ubuntu:20.04

# Avoids interaction
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies for Unity builds
RUN apt update && apt install -y \
    libglib2.0-0 \
    libnss3 \
    libgconf-2-4 \
    libxi6 \
    libxrandr2 \
    libxinerama1 \
    libxcursor1 \
    libxcomposite1 \
    libasound2 \
    libpulse0 \
    libxss1 \
    libxtst6 \
    libc6 \
    && rm -rf /var/lib/apt/lists/*

# Copy server files
COPY . /server
WORKDIR /server

# Make executable
RUN chmod +x ServerBuild.x86_64

# Expose your FishNet portE:\Unity New Projects\Yakuza Ball Game MULTIPLAYER_clone_0\GameServer\ServerBuild
EXPOSE 7770

# Start the server
CMD ["./ServerBuild.x86_64"]