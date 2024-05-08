{
  lib,
  fetchFromGitHub,
}: rec {
  version = "1.4.5";

  src = fetchFromGitHub {
    owner = "galister";
    repo = "WlxOverlay";
    rev = "v${version}";
    hash = "sha256-mDJdA5viCTfBF+JXDacVo/EwS1GD6FhTnU6B+uE5zCY=";
  };

  meta = {
    description = "A simple OpenVR overlay for Wayland and X11 desktops";
    homepage = "https://github.com/galister/WlxOverlay";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [Scrumplex];
    platforms = lib.platforms.linux;
  };
}
