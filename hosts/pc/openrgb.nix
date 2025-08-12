{ pkgs, ... }:
let
  openrgb-experimental = pkgs.openrgb-with-all-plugins.overrideAttrs (finalAttrs: previousAttrs: {
    version = "master";
    src = pkgs.fetchFromGitLab {
      owner = "CalcProgrammer1";
      repo = "OpenRGB";
      rev = "47783feecbba5126a2f12a4a0dc59adcb1d58d14";
      hash = "sha256-fka9kDK/jWNzeZH+3tygnUn1ZCB4MQ+xqq6LFrPdllo=";
    };
    postPatch = ''
      patchShebangs scripts/build-udev-rules.sh
      substituteInPlace scripts/build-udev-rules.sh
    '';
    installPhase = ''
      sed -i -e "s/install_udev_rules install_systemd_service/ /g" ./Makefile
      # sed -i -e "s+/usr/bin/env/+${pkgs.coreutils}/bin/env+g" $out/lib/udev/rules.d/60-openrgb.rules
      make install
    '';
    buildInputs = with pkgs; [
      openal
      libusb1
      hidapi
      mbedtls_2
    ]
    ++ (with libsForQt5; [
      qtbase
      qttools
      qtwayland
    ]);
  });
in {
  services.hardware.openrgb = {
    enable = true;
    package = openrgb-experimental;
    server.port = 6742;
  };
}
