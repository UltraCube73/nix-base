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
        localai = {
          image = "localai/localai:latest-gpu-nvidia-cuda-12";
          ports = [
            "127.0.0.1:8080:8080"
          ];
          extraOptions = [
            "--device=nvidia.com/gpu=all"
          ];
          cmd = [
            "--p2p"
          ];
          volumes = [
            "localai:/models"
          ];
        };
      };
    };
  };
}