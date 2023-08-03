{
  inputs,
  self,
  ...
}: {
  imports = [
    ./dev.nix
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
    "x86_64-darwin"
    "aarch64-darwin"
  ];
}
