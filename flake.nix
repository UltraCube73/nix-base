{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    lanzaboote.url = "github:nix-community/lanzaboote";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, lanzaboote, home-manager, ... }:
  let
    base_modules = [
      ./os-base
      ./hardware-configuration.nix
    ];
  in {
    nixosConfigurations.base = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = base_modules;
    };
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = base_modules ++ [
        ./hosts/pc
        ./desktop-environments/sway
        lanzaboote.nixosModules.lanzaboote
      ];
    };
    nixosConfigurations.nb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = base_modules ++ [
        ./hosts/nb
        ./desktop-environments/sway
      ];
    };
  };
}
