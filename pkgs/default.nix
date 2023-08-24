{
  inputs,
  self,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    system,
    ...
  }: {
    # Nixpkgs instantiated for supported systems with our overlay.
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [self.overlays.default];
    };

    packages = let
      overlayPkgs = self.overlays.default pkgs null;
      # use the packages the we overlaid onto pkgs
      allPackages = builtins.mapAttrs (name: _: pkgs.${name}) overlayPkgs;
    in
      lib.filterAttrs (_: v: builtins.elem system (v.meta.platforms or []) && !(v.meta.broken or false))
      allPackages;
  };

  flake.overlays.default = final: _: import ./all-packages.nix final;
}
