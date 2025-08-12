{
  hardware.nvidia-container-toolkit.enable = true;
  users.users.shooter.extraGroups = [ "docker" ];
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings.data-root = "/mnt/datadisk/docker";
    };
    oci-containers = {
      backend = "docker";
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