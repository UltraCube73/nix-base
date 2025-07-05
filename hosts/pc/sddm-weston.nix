{ pkgs, lib, config, ... }:
let
  xcfg = config.services.xserver;
  westonConf = (pkgs.formats.ini {}).generate "weston.ini" {
    libinput = {
      enable-tap = config.services.libinput.mouse.tapping;
      left-handed = config.services.libinput.mouse.leftHanded;
    };
    keyboard = {
      keymap_model = xcfg.xkb.model;
      keymap_layout = xcfg.xkb.layout;
      keymap_variant = xcfg.xkb.variant;
      keymap_options = xcfg.xkb.options;
    };
    output = {
      name = "DP-1";
      mode = "off";
    };
  };
in {
  services.displayManager.sddm.wayland.compositorCommand = "${lib.getExe pkgs.weston} --shell=kiosk -c ${westonConf}";
}