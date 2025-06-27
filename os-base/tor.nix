{ pkgs, ... }:
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [
        "obfs4 94.112.227.176:28786 11B1F55355121B050B9A2F6721B80664953D40CD cert=G5ObgCM01fGF9KdD/p8HjX3Y82drt9rFreLOM7BP7QtvHaotMCobs151ruOxV8rwInxNFA iat-mode=0"
        "obfs4 79.174.91.219:443 AF223CF21BE559A7BF216F734ECBD072394EE606 cert=qwkb2SF/WNsBGBxXYJtNx2F8j7r6vSk81aMmQC3KhGPKD3f9CB/sEKqSf5C/486sN2mWJw iat-mode=0"
        "obfs4 57.128.57.245:3099 D655AC9C21147BB62C781149150F0E723C4F8FBC cert=fnU2eGPmE6L53eXZf/29d1JloUD2XI/4KHNImTquPr/eBvkrOuuutIlpwvJsZTV1NvZ4aw iat-mode=0"
        "obfs4 46.226.107.235:57180 93BD2E597D164D9FE9C74BF3E0F68531AC17EFB2 cert=lkV0hpUCIEEpU1nIFGnBJoabeXn0BFykm3NIf4an09Kq8nTK+qv6Z3A1i3Rkkc3hGMoqSA iat-mode=0"
      ];
    };
  };
}