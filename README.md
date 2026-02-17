# nanobrew-nix

Nix package for [nanobrew](https://github.com/justrach/nanobrew) — the fastest macOS package manager.

## Usage

```bash
# Run directly
nix run github:uzaaft/nanobrew-nix

# Install to profile
nix profile install github:uzaaft/nanobrew-nix

# Use in a flake
{
  inputs.nanobrew.url = "github:uzaaft/nanobrew-nix";
}
```

## Overlay

```nix
{
  nixpkgs.overlays = [ nanobrew.overlays.default ];
}
```
