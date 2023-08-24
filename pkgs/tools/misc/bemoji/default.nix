{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  makeWrapper,
  coreutils,
  gnused,
  gnugrep,
  curl,
  bemenu,
  wl-clipboard,
  wtype,
  menuTool ? bemenu,
  clipboardTool ? wl-clipboard,
  typeTool ? wtype,
}:
stdenvNoCC.mkDerivation rec {
  pname = "bemoji";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "marty-oehme";
    repo = "bemoji";
    rev = version;
    hash = "sha256-XXNrUaS06UHF3cVfIfWjGF1sdPE709W2tFhfwTitzNs=";
  };

  nativeBuildInputs = [
    makeWrapper
  ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 bemoji $out/bin/bemoji

    runHook postInstall
  '';

  postFixup = let
    binaries = [coreutils gnused gnugrep curl menuTool clipboardTool typeTool];
  in ''
    wrapProgram $out/bin/bemoji \
      --prefix PATH : "${lib.makeBinPath binaries}"
  '';

  meta = with lib; {
    changelog = "https://github.com/marty-oehme/bemoji/blob/${src.rev}/CHANGELOG.md";
    description = "Emoji picker that remembers your favorites, with support for bemenu/wofi/rofi/dmenu and wayland/X11";
    homepage = "https://github.com/marty-oehme/bemoji";
    license = licenses.mit;
    mainProgram = "bemoji";
    maintainers = [maintainers.Scrumplex];
    platforms = platforms.linux;
  };
}
