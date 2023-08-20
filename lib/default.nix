lib: let
  args = {inherit lib;};
in {
  sway = import ./sway.nix args;
}
