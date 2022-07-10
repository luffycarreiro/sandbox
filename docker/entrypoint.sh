#!/usr/bin/env bash

mix deps.get
mix phx.digest
exec mix phx.server
