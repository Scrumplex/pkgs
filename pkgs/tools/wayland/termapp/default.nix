{
  lib,
  stdenv,
  coreutils,
  kitty,
  run-or-raise,
}:
stdenv.mkDerivation rec {
  pname = "termapp";
  version = "20230210";

  src = [./termapp.sh];

  dontUnpack = true;

  buildInputs = [coreutils kitty run-or-raise];

  installPhase = ''
    install -Dpm755 $src $out/bin/termapp
  '';

  postFixup = let
    runtimePath = lib.makeBinPath buildInputs;
  in ''
    sed -i "2 i export PATH=${runtimePath}:\$PATH" $out/bin/termapp
  '';

  meta = with lib; {
    description = "A utility to run terminal apps using run-or-raise";
    homepage = "https://codeberg.org/Scrumplex/dotfiles";
    license = licenses.gpl3Plus;
    mainProgram = "termapp";
    maintainers = with maintainers; [Scrumplex];
    platforms = platforms.linux;
  };
}
