{ pkgs, ... }:
{
  networking.networkmanager.enable = true;

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

  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };

  networking.firewall.enable = true;
}