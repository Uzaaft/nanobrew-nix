{
  description = "Nix package for nanobrew — the fastest macOS package manager, written in Zig";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          nanobrew = pkgs.callPackage ./package.nix { };
          default = self.packages.${system}.nanobrew;
        }
      );

      overlays.default = _final: prev: {
        nanobrew = prev.callPackage ./package.nix { };
      };
    };
}
