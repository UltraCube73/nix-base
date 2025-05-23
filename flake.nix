{
  description = "OS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    lanzaboote.url = "github:nix-community/lanzaboote";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, lanzaboote, home-manager, ... }:
  let
    base_modules = [
      ./os-base
      ./hw.nix
    ];
  in
  {
    nixosConfigurations.base = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = base_modules;
    };
    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
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
