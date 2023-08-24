{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    {
      imports = [
        ./flake/devShell.nix
        ./kernelPatches
        ./modules
        ./pkgs
      ];

      systems = [
        "x86_64-linux"
        "aarch64-linux"
        # TODO: figure out how to inherit packages while checking their platforms
        #"x86_64-darwin"
        #"aarch64-darwin"
      ];
    };
}
