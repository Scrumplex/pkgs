{
  perSystem = {
    lib,
    pkgs,
    system,
    ...
  }: let
    allPackages = import ./all-packages.nix {} pkgs;
    packages = lib.filterAttrs (_: v: builtins.elem system (v.meta.platforms or [system]) && !(v.meta.broken or false)) allPackages;
  in {
    inherit packages;
  };

  flake.overlays.default = import ./all-packages.nix;
}
