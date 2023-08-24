{self, ...}: {
  flake = {
    hmModules = {
      catppuccin = import ./hm/catppuccin.nix;
      fish-theme = import ./hm/fish-theme.nix;
      jellyfin-mpv-shim = import ./hm/jellyfin-mpv-shim.nix;
      pipewire = import ./hm/pipewire.nix;
      waybar-camera-blank = import ./hm/waybar/camera-blank.nix;
      waybar-pa-mute = import ./hm/waybar/pa-mute.nix;
    };
    homeModules = self.hmModules;
    nixosModules = {
      flatpak-icons-workaround = import ./nixos/flatpak-icons-workaround.nix;
      monado = import ./nixos/monado.nix;
      vdpau = import ./nixos/vdpau.nix;
    };
  };
}
