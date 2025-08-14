{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    git-crypt
    home-manager
  ];
}