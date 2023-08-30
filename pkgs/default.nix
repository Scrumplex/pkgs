{
  perSystem = {pkgs, ...}: {
    packages = import ./all-packages.nix {} pkgs;
  };

  flake.overlays.default = import ./all-packages.nix;
}
