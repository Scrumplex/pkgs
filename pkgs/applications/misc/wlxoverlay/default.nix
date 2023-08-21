{
  lib,
  buildDotnetModule,
  fetchFromGitHub,
  libwlxpw,
  libwlxshm,
  openvr,
  glfw,
}: let
  common = import ./common.nix {inherit lib fetchFromGitHub;};
in
  buildDotnetModule {
    pname = "wlxoverlay";

    inherit (common) version src meta;

    nugetDeps = ./deps.nix;

    patches = [
      ./dont-bundle-openvr.patch
    ];

    executables = ["WlxOverlay"];
    runtimeDeps = [libwlxpw libwlxshm openvr glfw];
  }
