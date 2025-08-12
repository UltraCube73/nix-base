{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ v2rayn ];
  programs.v2ray.enable = true;
}