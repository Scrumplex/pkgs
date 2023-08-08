# pkgs

Nix packages and expressions

## Usage

Add `github:Scrumplex/pkgs` to your flake inputs:

```nix
  inputs = {
    # ...
    scrumpkgs = {
      url = "github:Scrumplex/pkgs";
      #inputs.nixpkgs.follows = "nixpkgs";
      #inputs.pre-commit-hooks.follows = "pre-commit-hooks";
    };
  };
```

### Apply overlay (NixOS)

```nix
# assumes that your flake `inputs` are in your NixOS specialArgs
{inputs, ...}:
{
  nixpkgs.overlays = [inputs.scrumpkgs.overlays.default];
}
```

### Add NixOS modules

```nix
# assumes that your flake `inputs` are in your NixOS specialArgs
{inputs, ...}:
{
  # monado is an example here
  imports = [inputs.scrumpkgs.nixosModules.monado];
}
```

### Add Home Manager modules (using HM NixOS module)

```nix
# assumes that your flake `inputs` are in your NixOS specialArgs
{inputs, ...}:
{
  # pipewire is an example here
  home-manager.sharedModules = [inputs.scrumpkgs.hmModules.pipewire];
}
```

## Tips & Tricks

### Add all NixOS/HM modules

```nix
# assumes that your flake `inputs` are in your NixOS specialArgs
{inputs, ...}:
{
  imports = builtins.attrValues inputs.scrumpkgs.nixosModules;

  home-manager.sharedModules = builtins.attrValues inputs.scrumpkgs.hmModules;
}
```
