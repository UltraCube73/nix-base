{ pkgs, ... }:
{
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins; 
    server.port = 6742;
  };
}
