{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pcsc-tools
    ccid
    opensc
    #openct
    #pcsclite
    p11-kit
    gnutls
    pkcs11-provider
  ];
  services.pcscd.enable = true;
  security.pam.p11.enable = true;
}