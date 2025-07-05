{ pkgs, ... }:
let
  sddm-theme = pkgs.stdenvNoCC.mkDerivation rec {
    name = "sddm-theme";
    src = [
      (./theme.tar.gz)
      (pkgs.fetchFromGitHub {
        owner = "stepanzubkov";
        repo = "where-is-my-sddm-theme";
        rev = "2fddf85ec80ff02a8e20fdcba51a30b436d76e6c";
        hash = "sha256-SNCgpgPyJf9tKE6UyvmEpSJbIfLmAmPazTF85j0W7a0=";
      })
    ];
    sourceRoot = ".";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out
      #cp -r ./* $out
      cp -r ./source/where_is_my_sddm_theme_qt5/* $out
      cp ./wallpaper.png $out/wallpaper.png
      cp ./theme.conf $out/theme.conf
    '';
  };
in
{
  #environment.systemPackages = with pkgs; [
  #  sddm-theme
  #];
  services.displayManager.sddm = {
    theme = "${sddm-theme}";
    extraPackages = [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];
  };
  #environment.systemPackages = [
  #  (
  #    pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
  #      [General]
  #      background = ${background-package}
  #    ''
  #  )
  #];
}