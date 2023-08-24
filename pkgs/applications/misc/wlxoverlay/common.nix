{
  lib,
  fetchFromGitHub,
}: rec {
  version = "1.3.1";

  src = fetchFromGitHub {
    owner = "galister";
    repo = "WlxOverlay";
    rev = "v${version}";
    hash = "sha256-MaDIGLeaRVfk2/wF0mpL2gHkG4WhomY5Y3VXSoG/jp8=";
  };

  meta = {
    description = "A simple OpenVR overlay for Wayland and X11 desktops";
    homepage = "https://github.com/galister/WlxOverlay";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [Scrumplex];
    platforms = lib.platforms.linux;
  };
}
