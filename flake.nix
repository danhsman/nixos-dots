{
  description = "NixOS from Scratch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.danhs = { pkgs, ... }: {
              imports = [
                nixvim.homeModules.nixvim
                ./home.nix
                ./modules/nixvim.nix
                ./modules/git.nix
              ];
            };

            backupFileExtension = "backup";

          };
        }
      ];
    };
    templates = {
      c = {
        path = ./templates/c;
        description = "C/C++ development environment";
      };
      python = {
        path = ./templates/python;
        description = "Python development environment";
      };
      rust = {
        path = ./templates/rust;
        description = "Rust development environment";
      };
    };
  };
}
