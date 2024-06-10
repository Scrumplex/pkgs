{
  lib,
  stdenv,
  fetchFromGitea,
  makeWrapper,
  bash,
  coreutils,
  curl,
  file,
  gzip,
  kdialog,
  sox,
  xdg-utils,
}:
stdenv.mkDerivation {
  pname = "screenshot-bash";
  version = "unstable-2024-06-10";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "Scrumplex";
    repo = "screenshot-bash";
    rev = "4569538377974daf37050c03aed710d9ab3678e7";
    hash = "sha256-0U8ita5pDMbIFBqVFhSBnGSNrgfAm7d82g8Mgcpu+iM=";
  };

  nativeBuildInputs = [makeWrapper];

  doBuild = false;

  installPhase = ''
    runHook preInstall

    install -Dm755 screenshot-bash $out/bin/screenshot-bash
    install -Dm755 upload-bash $out/bin/upload-bash

    runHook postInstall
  '';

  postInstall = let
    runtimePrograms = [
      bash
      coreutils
      curl
      file
      gzip
      kdialog
      sox
      xdg-utils
    ];
  in ''
    wrapProgram $out/bin/screenshot-bash --prefix PATH : $out/bin --prefix PATH : '${lib.makeBinPath runtimePrograms}'
    wrapProgram $out/bin/upload-bash --prefix PATH : $out/bin --prefix PATH : '${lib.makeBinPath runtimePrograms}'
  '';

  meta = with lib; {
    homepage = "https://codeberg.org/Scrumplex/screenshot-bash";
    description = "screenshot - upload - copy-url pipeline";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [Scrumplex];
    platforms = platforms.linux;
    mainProgram = "screenshot-bash";
  };
}
