{ config, pkgs, lib, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;
  boot.loader.systemd-boot.configurationLimit = 1;

  networking.hostName = "pc";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Ulyanovsk";

  i18n.defaultLocale = "ru_RU.UTF-8";

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.tor = {
    enable = true;
    client = {
      enable = true;
      dns.enable = true;
    };
    openFirewall = true;
    settings = {
      ControlPort = 9051;
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [
        "obfs4 37.228.129.80:2056 B9A0ABC85F8FDECD3D73F8252A73C4BB22AAD3BD cert=I+5neLvuWJWl6NId2yvwo1sFqgthuIeYAtQY+q6I0mVz3ITLPo9AP35f8WJQsS8o2g5EOw iat-mode=0"
        "obfs4 91.229.62.13:8042 60FBE30CDAD05EA2E43A84A03303811C74C71E2A cert=viLwWECfGgkNnVUEG1Sr1KD58JXBizufcENJwtaqoI9/cP2xYHY/HBY5HGrHpdI/ZM3/Og iat-mode=0"
        "obfs4 88.99.188.75:41833 75A1DC843195530D95B6FADCBA674AD057DFD60B cert=NUujk/7VcGcjPGmvtO2/8nqQ+VDJ6VK59oPZCcRmOwE938E/JHmX7V1UwGYrHHu7IuO5SQ iat-mode=0"
        "obfs4 46.226.105.33:30123 62A1BE93B046F746F90D7C5FB89033E5F3FBE012 cert=F6TKdcIVV0DoRULHcelK5vkFAXQuzlLXZpqAPZyG+SKbCWHOW8vSxHEm6FUUlUu3Y459cg iat-mode=0"
      ];
      DNSPort = [ { addr = "127.0.0.1"; port = 53; } ];
    };
  };

  #networking.nameservers = [ "127.0.0.1" ];

  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };

  users.users.shooter = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPassword = "$y$j9T$Bf/d7tLoONMx9Y0TeZzYZ1$Pkgjfgsu4qX81WCs47KnOxk/15yJwoCrRPTc03FXqu/";
  };

  users.mutableUsers = false;

  environment.systemPackages = with pkgs; [
    git
    home-manager
    gnumake
    dig
  ];

  services.openssh.enable = true;

  networking.firewall.enable = true;

  system.stateVersion = "24.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
