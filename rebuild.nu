#!/usr/bin/env nu

# Usage:
#   ./rebuild.nu                            # uses current hostname + "."
#   ./rebuild.nu mister                     # build host "mister" from "."
#   ./rebuild.nu -f ~/all-mighto            # build current hostname from that flake
#   ./rebuild.nu mister -- -L --show-trace  # pass extra flags to nixos-rebuild

def main [
  host: string = ""
  --flake (-f): string = "."
  ...args: string
]: nothing -> nothing {
  let host = if $host == "" { (hostname | str trim) } else { $host }
  let attr = $"($flake)#($host)"
  sudo nixos-rebuild switch --flake $attr ...$args
}
