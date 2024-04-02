FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    zlib1g-dev


RUN git clone https://github.com/lh3/minimap2
WORKDIR minimap2 
RUN make

# Add minimap2 to PATH
ENV PATH="/minimap2:${PATH}"
