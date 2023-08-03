{self, ...}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages = let
      overlayPkgs = self.overlays.default pkgs null;
    in
      lib.genAttrs (builtins.attrNames overlayPkgs) (pkg: pkgs.${pkg});
  };

  flake = {
    overlays.default = final: _: import ../pkgs final;
    kernelPatches = import ../kernelPatches;
  };
}
