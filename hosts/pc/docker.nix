{
  users.users.shooter.extraGroups = [ "docker" ];
  virtualisation = {
    docker = {
      enable = true;
      daemon.settings.data-root = "/mnt/datadisk/docker";
    };
    oci-containers = {
      backend = "docker";
      containers = {
        postgres = {
          image = "postgres:17.5";
          ports = [ "5432:5432" ];
          volumes = [ "postgres:/var/lib/postgresql/data" ];
          environmentFiles = [ "/root/postgres.env" ];
        };
      };
    };
  };
}