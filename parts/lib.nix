{inputs, ...}: let
  ourLib = lib: {
    scrumplex = import ../lib lib;
  };
in {
  flake = {
    lib = ourLib inputs.nixpkgs.lib;

    overlays.lib = _: prev: {
      lib = prev.lib.extend (final: _: ourLib final);
    };
  };
}
