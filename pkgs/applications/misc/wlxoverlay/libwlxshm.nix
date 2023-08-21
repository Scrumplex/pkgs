{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  xorg,
}: let
  common = import ./common.nix {inherit lib fetchFromGitHub;};
in
  stdenv.mkDerivation {
    pname = "libwlxshm";

    inherit (common) version src meta;

    sourceRoot = "source/lib/wlxshm";

    nativeBuildInputs = [cmake];

    buildInputs = [xorg.libxcb];

    installPhase = ''
      runHook preInstall

      install -Dm755 libwlxshm.so $out/lib/libwlxshm.so

      runHook postInstall
    '';
  }
