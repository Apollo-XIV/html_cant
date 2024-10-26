{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils}:
  flake-utils.lib.eachDefaultSystem(system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
        ];
      };
    in {
      packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

      packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          direnv
          nix-direnv
          cargo
          rustc
          rust-analyzer
          just
          pest-ide-tools
        ];
      };
  });
}
