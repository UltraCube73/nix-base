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
        #mysql = {
        #  image = "mysql:9.3.0";
        #  ports = [ "3306:3306" ];
        #  volumes = [ "mysql:/var/lib/mysql" ];
        #  environmentFiles = [ "/root/mysql.env" ];
        #};
        postgres = {
          image = "postgres:17.5";
          ports = [ 5432:5432 ];
          volumes = [ "postgres:/var/lib/postgresql/data" ];
          environmentFiles = [ "/root/postgres.env" ];
        };
      };
    };
  };
}