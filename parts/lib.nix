{inputs, ...}: let
  ourLib = lib: {
    scrumplex = import ../lib lib;
  };
  extendLib = lib: lib.extend (final: _: ourLib final);
in {
  flake = {
    lib = extendLib inputs.nixpkgs.lib;

    overlays.lib = _: prev: {
      lib = extendLib prev.lib;
    };
  };
}
