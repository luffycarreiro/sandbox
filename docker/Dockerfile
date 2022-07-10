FROM ubuntu:20.04

# Set Locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Software versions (https://www.erlang-solutions.com/resources/download.html)
ENV ERLANG_VERSION 1:24.2.1-1
ENV ELIXIR_VERSION 1.13.0-1

# Skip post-install steps
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    gnupg \
    inotify-tools \
    wget && \
    wget -O /tmp/node.sh https://deb.nodesource.com/setup_16.x && \
    bash /tmp/node.sh && rm /tmp/node.sh && \
    apt-get install nodejs -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Erlang & Elixir with Erlang Solutions repo.
RUN wget --no-check-certificate \
         -qO erlang-repo.deb \
         https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && \
    dpkg -i erlang-repo.deb && \
    rm erlang-repo.deb && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
                    libwxgtk-webview3.0-gtk3-0v5 \
                    esl-erlang=$ERLANG_VERSION \
                    elixir=$ELIXIR_VERSION && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create required dirs
RUN mkdir /app

# Install hex and rebar
RUN mix local.hex --force
RUN mix local.rebar --force

# Set /app as workdir
WORKDIR /app
