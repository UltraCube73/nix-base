{
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };

  networking.networkmanager.enable = true;

  networking.firewall.enable = true;

  services.journald.extraConfig = "SystemMaxUse=256M";
}