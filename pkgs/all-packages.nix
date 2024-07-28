final: prev: let
  callPackage = final.callPackage or (prev.lib.callPackageWith (prev // packages));

  packages = {
    bemoji = callPackage ./tools/misc/bemoji {};

    fuzzel-dmenu-shim = callPackage ./tools/wayland/fuzzel-dmenu-shim {};

    libwlxpw = callPackage ./applications/misc/wlxoverlay/libwlxpw.nix {};

    libwlxshm = callPackage ./applications/misc/wlxoverlay/libwlxpw.nix {};

    run-or-raise = callPackage ./tools/wayland/run-or-raise {};
    run-or-raise-hyprland = callPackage ./tools/wayland/run-or-raise {
      backend = "hyprland";
    };

    screenshot-bash = callPackage ./tools/graphics/screenshot-bash {};

    termapp = callPackage ./tools/wayland/termapp {};

    wlxoverlay = callPackage ./applications/misc/wlxoverlay {};

    zoom65-udev-rules = callPackage ./os-specific/linux/zoom65-udev-rules {};
  };
in
  packages
