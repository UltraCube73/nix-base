{ pkgs, lib, inputs, ... }:
let
  bridgesDerivation = pkgs.stdenvNoCC.mkDerivation {
    name = "torbridges";
    src = inputs.torbridges;
    dontUnpack = true;
    installPhase = ''
      cp $src/bridges-obfs4 $out
    '';
  };
  bridges = pkgs.lib.lists.remove "" (pkgs.lib.strings.splitString "\n" (builtins.readFile bridgesDerivation));
in {
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = bridges;
    };
  };
}