{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;
  };
}

