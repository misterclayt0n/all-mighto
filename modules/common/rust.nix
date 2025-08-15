{ inputs, lib, pkgs, ... }:
let
  fenix = inputs.fenix.packages.${pkgs.system};

  toolchain = fenix.complete.withComponents [
    "cargo"
    "clippy"
    "rust-src"    
    "rustc"
    "rustfmt"
    "rust-analyzer"
  ];
in
{
  environment.variables = {
    CARGO_NET_GIT_FETCH_WITH_CLI = "true"; 
    LIBRARY_PATH = lib.mkIf pkgs.stdenv.isDarwin (lib.makeLibraryPath [ pkgs.libiconv ]);
  };

  environment.systemPackages = with pkgs; [
    toolchain

    cargo-deny
    cargo-expand
    cargo-fuzz
    cargo-nextest

    evcxr
    taplo
  ];
}

