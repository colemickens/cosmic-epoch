#!/usr/bin/env nu

let rev = (git resolve ./link)
nix flake lock --override-input cosmic-comp $rev
