{
  services.tor = {
    client.dns.enable = true;
    settings.DNSPort = [ { addr = "127.0.0.1"; port = 53; } ];
  };

  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };
}