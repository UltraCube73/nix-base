{ pkgs, ... }:
{
  #environment.systemPackages = with pkgs; [
  #  wl-clipboard
  #  mako
  #];

  programs.sway = {
    enable = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
    wrapperFeatures.gtk = true;
  };
}