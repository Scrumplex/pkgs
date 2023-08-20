{
  inputs,
  self,
  ...
}: {
  imports = [
    ./dev.nix
    ./lib.nix
    ./modules.nix
    ./pkgs.nix
  ];

  perSystem = {system, ...}: {
    # Nixpkgs instantiated for supported systems with our overlay.
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [self.overlays.default];
    };
  };

  systems = [
    "x86_64-linux"
    "aarch64-linux"
    # TODO: figure out how to inherit packages while checking their platforms
    #"x86_64-darwin"
    #"aarch64-darwin"
  ];
}
