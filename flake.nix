{
  description = "Jonas's NixOS system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, niri, dankMaterialShell, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./configuration.nix
          niri.nixosModules.niri
          dankMaterialShell.nixosModules.dank-material-shell
        ];
      };
    };
}
