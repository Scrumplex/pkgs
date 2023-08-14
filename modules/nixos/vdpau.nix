{
  config,
  lib,
  ...
}: let
  inherit (lib) types;
  inherit (lib.options) mdDoc mkOption;
  inherit (lib.modules) mkIf;

  cfg = config.hardware.opengl.vdpau;
in {
  options.hardware.opengl.vdpau = {
    driverName = mkOption {
      description = mdDoc ''
        Name of the VDPAU driver.
        You can list all installed drivers by checking for library files in `/run/opengl-driver/lib/vdpau`.
        These vdpau drivers follow the naming scheme `libvdpau_<driver name>.so`
      '';
      example = "radeonsi";
      type = types.str;
    };
  };

  config = mkIf (cfg.driverName != null) {
    environment.variables."VDPAU_DRIVER" = cfg.driverName;
  };
}
