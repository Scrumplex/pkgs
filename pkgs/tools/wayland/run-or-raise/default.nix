{
  lib,
  stdenv,
  sway,
}:
stdenv.mkDerivation rec {
  pname = "run-or-raise";
  version = "20230210";

  src = [./run-or-raise.sh];

  dontUnpack = true;

  buildInputs = [sway];

  installPhase = ''
    install -Dpm755 $src $out/bin/run-or-raise
  '';

  postFixup = let
    runtimePath = lib.makeBinPath buildInputs;
  in ''
    sed -i "2 i export PATH=${runtimePath}:\$PATH" $out/bin/run-or-raise
  '';

  meta = with lib; {
    description = "A run-or-raise application switcher for Sway";
    homepage = "https://codeberg.org/Scrumplex/dotfiles";
    license = licenses.gpl3Plus;
    mainProgram = "run-or-raise";
    maintainers = with maintainers; [Scrumplex];
    platforms = platforms.linux;
  };
}
