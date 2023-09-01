{lib, ...}: {
  /*
  Filter packages from overlay, instead of inheriting all overrides.

  Example:
    filterOverlay inputs.foo.overlays.default ["bar"]
    => (final: prev: { bar = «derivation /nix/store/00000000000000000000000000000000-foo-1.0.0.drv»; }
  Type:
    filterOverlay :: Lambda -> [String] -> Lambda
  */
  filterOverlay = overlay: pkgNames: (final: prev: let
    overlay' = overlay final prev;
  in
    lib.genAttrs pkgNames (name: overlay'.${name}));
}
