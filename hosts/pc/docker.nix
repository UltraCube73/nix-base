{
  users.users.shooter.extraGroups = [ "docker" ];
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings.data-root = "/mnt/datadisk/docker";
    };
    oci-containers = {};
  };
}