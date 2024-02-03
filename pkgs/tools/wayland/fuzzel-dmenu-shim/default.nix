{
  lib,
  stdenvNoCC,
  makeWrapper,
  fuzzel,
}:
stdenvNoCC.mkDerivation {
  pname = "fuzzel-dmenu-shim";
  version = "0-unstable-2024-02-03";

  nativeBuildInputs = [makeWrapper];

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    makeWrapper ${lib.getExe fuzzel} $out/bin/fuzzel-menu \
      --add-flags "--dmenu"
    ln -s fuzzel-menu $out/bin/dmenu
    ln -s fuzzel-menu $out/bin/dmenu-wl
    ln -s fuzzel-menu $out/bin/bemenu
    runHook postInstall
  '';

  meta = with lib; {
    description = "A shim that makes it possible to use fuzzel for any dmenu script.";
    homepage = "https://codeberg.org/Scrumplex/flake";
    license = licenses.gpl3Plus;
    mainProgram = "fuzzel-menu";
    maintainers = with maintainers; [Scrumplex];
    platforms = platforms.linux;
  };
}
