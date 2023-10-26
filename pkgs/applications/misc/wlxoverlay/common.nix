{
  lib,
  fetchFromGitHub,
}: rec {
  version = "1.4.1";

  src = fetchFromGitHub {
    owner = "galister";
    repo = "WlxOverlay";
    rev = "v${version}";
    hash = "sha256-KahP26ZjkJpNdn1T69fPHvZoZ+v6AyGEo498I5uLR2I=";
  };

  meta = {
    description = "A simple OpenVR overlay for Wayland and X11 desktops";
    homepage = "https://github.com/galister/WlxOverlay";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [Scrumplex];
    platforms = lib.platforms.linux;
  };
}
