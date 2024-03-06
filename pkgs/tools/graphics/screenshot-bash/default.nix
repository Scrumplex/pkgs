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
stdenv.mkDerivation (_: {
  pname = "screenshot-bash";
  version = "unstable-2023-03-01";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "Scrumplex";
    repo = "screenshot-bash";
    rev = "afe18036aab6eefafa53c005abdbfaf5cd2c290b";
    hash = "sha256-b5xTm9Gr2F1iFq2WXYLV13HJ4KSnqpzPnurSPI9xJsA=";
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
})
