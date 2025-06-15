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
        "obfs4 89.166.189.186:8080 02F00A33017A24E99112E5CA498AECD204F913F3 cert=eWfCYOE/3kdmDpYy/tT0CuKI01dWKY6BtSAMSu0uuD4ixo7RE4/av+0fNjw4sbZmORLKVQ iat-mode=0"
        "obfs4 85.215.50.238:10005 85B406A2834B0CF5A0B756D1EFA86E8217D86F8C cert=8LmU18wvxeDrtNDXpbw3msowEbG1jAP/wXy4nVgHuUmY4x/zJWMcTMhPqcnRPLZtNm8nLQ iat-mode=0"
        "obfs4 51.83.248.35:25981 D08B4760D128C1A65506577E063D9D26C2A71815 cert=UJWUh+sIDdOKja/byBM2+qP9AFNl86hkGRFJ/lM1GWKP79eCu3PT4WTXI2gdXYULbQ0EMg iat-mode=0"
        "obfs4 49.13.131.4:52272 34EC2B21400195274E390E9EA564439C9DBB4E36 cert=g6Raa9uydXdmtQ545qtRpw2PoTwRrHN7y9Wv83uCjaLko3JGSLhnHeB08JDqHZFSALLTCw iat-mode=0"
      ];
      DNSPort = [ { addr = "127.0.0.1"; port = 53; } ];
    };
  };

  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };

  networking.firewall.enable = true;
}