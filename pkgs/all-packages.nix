final: prev: let
  callPackage = final.callPackage or (prev.lib.callPackageWith (prev // packages));

  packages = {
    bemoji = callPackage ./tools/misc/bemoji {};

    fuzzel-dmenu-shim = callPackage ./tools/wayland/fuzzel-dmenu-shim {};

    run-or-raise = callPackage ./tools/wayland/run-or-raise {};
    run-or-raise-hyprland = callPackage ./tools/wayland/run-or-raise {
      backend = "hyprland";
    };

    screenshot-bash = callPackage ./tools/graphics/screenshot-bash {};

    termapp = callPackage ./tools/wayland/termapp {};
  };
in
  packages
