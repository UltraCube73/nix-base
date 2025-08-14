{
  hardware.nvidia-container-toolkit.enable = true;
  users.users.shooter.extraGroups = [ "docker" "vboxusers" ];
  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
        enableKvm = true;
        addNetworkInterface = false;
      };
      guest = {
        enable = true;
        vboxsf = true;
        seamless = true;
        dragAndDrop = true;
        clipboard = true;
      };
    };
    docker.daemon.settings.data-root = "/mnt/datadisk/docker";
    oci-containers = {
      containers = {
        rsshub = {
          image = "diygod/rsshub";
          ports = [
            "127.0.0.1:1200:1200"
          ];
        };
      };
    };
  };
}