{ pkgs, lib, ... }:
{
  #environment.systemPackages = with pkgs; [
  #  kdePackages.breeze
  #];
  services.displayManager.sddm = {
    enable = true;
    # theme = lib.mkDefault "breeze";
    wayland.enable = true;
  };
}
