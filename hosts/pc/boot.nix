{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    sbctl
    tpm2-tss
    tpm2-tools
  ];

  security.tpm2.enable = true;

  boot.initrd.systemd = {
    enable = true;
    tpm2.enable = true;
  };

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}
