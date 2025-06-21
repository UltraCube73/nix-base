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
        "obfs4 188.142.52.214:8080 BCA99E5679C2D5329D717004E443639E1CC03036 cert=ZltHiQ258S0PVmcVzd3bu52kazHGCS/wdwIB/W2+JUu7FmyCP2WUPZ/7Ydqd6teYhBCDZQ iat-mode=0"
        "obfs4 57.135.160.121:143 9A3DB5528BEFFCFCA909177F90B62E9A3166EDB7 cert=2w2kmvSIBez3lzWG7rXdsUQ/J93iWKKhWeaXIj9TEbfYCLAQ1+FhYkRcSn5Bd7bdtJmuaQ iat-mode=0"
        "obfs4 146.59.116.226:50845 DA91DE63966E03676A9994BDB7A18D1DCE2FAF10 cert=IAur+EwfAIbdC8jy+Mi9xlmh5ouL577Ya6ygJBEChWS8lNiEfy3hU/IAvDZ5Ntw/w2Oidg iat-mode=0"
        "obfs4 51.68.237.122:30839 708208F4631469FB59B8957AD3D01F8E3B6FEF7A cert=kDJk2ux6zItpRvs9ugTQqWl1W8pc8vO3PiiRFZ7kcHFghRUphK/2uq4xCnbS7bjBx3VcTw iat-mode=0"
      ];
      DNSPort = [ { addr = "127.0.0.1"; port = 53; } ];
    };
  };

  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };

  networking.firewall.enable = true;
}