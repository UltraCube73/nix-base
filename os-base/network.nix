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
        "obfs4 94.209.98.133:36912 AC77472297C4040CCDD8F9E191D9A39F2ED53499 cert=DVsoSQNdfIg8FmYpjdaNC2pw5t3E+9XsHxSQOOMimEtn2sYImiWjUCsNdQLrCe5cmcfFUg iat-mode=0"
        "obfs4 103.29.64.211:443 1B8DA674BCB03A89B0054DBFEDBDE7EBB7F543AB cert=vJ8Gb7BuIKTxAFy8XaAw7WCiYaXgv3OZ6G1m2OJ7H85+eTpj0IQTsR89eym7DfoYAYAaXQ iat-mode=0"
        "obfs4 51.38.220.35:42954 B84BDFE3724928B06FC178FF50D5852E5AB7942A cert=6tpTDdnOaRl2elQqdxSmrJ5Gt9JkWcbquznpxx/lqVjRKv/bVecFnXie96KoblCWfvVjYA iat-mode=0"
        "obfs4 51.38.220.224:30996 22494A012CFA8C88B1D907E2CCB8409AC35B537B cert=dOPijSCG6FD89fYv5N2F9QoeK1od3tpG6VBE/kMY0Bt1aW/7aXPIzsENDoLWZe43gI8efw iat-mode=0"
      ];
      DNSPort = [ { addr = "127.0.0.1"; port = 53; } ];
    };
  };

  environment.etc = {
    "resolv.conf".text = "nameserver 127.0.0.1\n";
  };

  networking.firewall.enable = true;
}