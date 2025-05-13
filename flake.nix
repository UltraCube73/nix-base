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
      ./os-base/bluetooth.nix
      ./os-base/boot.nix
      ./os-base/i18n.nix
      ./os-base/kde.nix
      ./os-base/network.nix
      ./os-base/nix.nix
      ./os-base/pipewire.nix
      ./os-base/pkgs.nix
      ./os-base/services.nix
      ./os-base/users.nix
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
        ./hosts/pc/hostname.nix
        ./hosts/pc/password.nix
        ./hosts/pc/boot.nix
        ./hosts/pc/zfs.nix
        ./hosts/pc/nvidia.nix
        ./hosts/pc/docker.nix
        lanzaboote.nixosModules.lanzaboote
      ];
    };
    nixosConfigurations.nb = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = base_modules ++ [
        ./hosts/nb/hostname.nix
        ./hosts/nb/password.nix
      ];
    };
  };
}
