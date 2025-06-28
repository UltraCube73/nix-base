{ pkgs, ... }:
let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "sddm-wallpaper";
    src = ./.;
    dontUnpack = true;
    installPhase = ''
      cp $src/wallpaper.png $out
    '';
  };
in
{
  environment.systemPackages = [
    (
      pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background = ${background-package}
      ''
    )
  ];
}