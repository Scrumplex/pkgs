{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  pkg-config,
  ninja,
  freenect,
  pipewire,
}:
stdenv.mkDerivation rec {
  pname = "pipewire-module-kinect";
  version = "unstable-2021-09-18";

  src = fetchFromGitHub {
    owner = "zinstack625";
    repo = "kinect_pipewire";
    rev = "6e5b76e027d62abb362c8a057a8f636b88f1971b";
    hash = "sha256-OCWOn55V5SI0mgwJhojL8jA4UVy8WohPcpCW5/Mz8VQ=";
  };

  nativeBuildInputs = [
    meson
    pkg-config
    ninja
  ];

  buildInputs = [
    freenect
    pipewire
  ];

  postPatch = ''
    substituteInPlace meson.build --replace "/usr/lib/pipewire-0.3" "$out/lib/pipewire-0.3"
  '';

  meta = with lib; {
    description = "A userspace driver connecting microphone assembly of Xbox 360 kinect to pipewire";
    homepage = "https://github.com/zinstack625/kinect_pipewire";
    license = with licenses; [asl20];
    maintainers = with maintainers; [Scrumplex];
  };
}
