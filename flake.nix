{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    lanzaboote.url = "github:nix-community/lanzaboote";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    torbridges = {
      url = "github:/scriptzteam/Tor-Bridges-Collector/main";
      flake = false;
    };
  };
  outputs = inputs@{ self, nixpkgs, lanzaboote, home-manager, torbridges, ... }:
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
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = base_modules ++ [
        ./hosts/pc
        lanzaboote.nixosModules.lanzaboote
      ];
    };
    nixosConfigurations.nb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = base_modules ++ [
        ./hosts/nb
      ];
    };
  };
}
