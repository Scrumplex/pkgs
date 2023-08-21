{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  pipewire,
}: let
  common = import ./common.nix {inherit lib fetchFromGitHub;};
in
  stdenv.mkDerivation {
    pname = "libwlxpw";

    inherit (common) version src meta;

    sourceRoot = "source/lib/wlxpw";

    nativeBuildInputs = [cmake pkg-config];

    buildInputs = [pipewire];

    installPhase = ''
      runHook preInstall

      install -Dm755 libwlxpw.so $out/lib/libwlxpw.so

      runHook postInstall
    '';
  }
