{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    extraOptions = [
      "--unsupported-gpu"
    ];
    wrapperFeatures.gtk = true;
  };

  services.gvfs.enable = true;
}