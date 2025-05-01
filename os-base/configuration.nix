{ config, pkgs, ... }:
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
  
  services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
    "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
    };
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
  ];

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "24.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
