{ pkgs, ... }:
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [
        "obfs4 90.192.45.113:51121 86BDA202CAAD3865220C79DC564BFE07727D27F5 cert=VvivTvsAqUlCKDp30rpNHf5lU0eEwquwPoVCWRHTh68u9FyWPJHC0ufo4WUIHMqGkdLfUA iat-mode=0"
        "obfs4 85.215.50.238:10009 CA38DC17CBC7BF8651D9FD0EE42D297F728B2027 cert=f0u6PaGdUpTPd//H6QPVIjgjjL037lLbKz8u9/WYiF3/d43sW/FhDXM9pNFdO9NS7hWUBg iat-mode=0"
        "obfs4 51.38.220.224:30996 22494A012CFA8C88B1D907E2CCB8409AC35B537B cert=dOPijSCG6FD89fYv5N2F9QoeK1od3tpG6VBE/kMY0Bt1aW/7aXPIzsENDoLWZe43gI8efw iat-mode=0"
        "obfs4 57.128.59.134:24102 A4AE24E2BF9CCD542A9F2794D534D13A39F2F161 cert=dX8/pc880Ne2bMEfmw75yFmsbnoZ+rWl4NDIjrei/ADZ/nHAiYTUw2HodxTIW8cWaKEkKQ iat-mode=0"
      ];
    };
  };
}
