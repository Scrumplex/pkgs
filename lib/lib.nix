lib: let
  args = {inherit lib;};
in {
  pkgs = import ./pkgs.nix args;
  sway = import ./sway.nix args;
}
