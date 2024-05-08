{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  openvr,
  glfw,
  libwlxpw,
  libwlxshm,
  withWayland ? true,
  withX11 ? true,
}: let
  common = import ./common.nix {inherit lib fetchFromGitHub;};
in
  buildDotnetModule {
    pname = "WlxOverlay";

    inherit (common) version src;

    nugetDeps = ./deps.nix;

    patches = [
      ./dont-bundle-openvr.patch
    ];

    executables = ["WlxOverlay"];
    runtimeDeps =
      [openvr glfw]
      ++ lib.optional withWayland libwlxpw
      ++ lib.optional withX11 libwlxshm;

    meta =
      common.meta
      // {
        mainProgram = "WlxOverlay";
      };
  }
