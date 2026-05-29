{
  description = "Hyprland on Nixos";

  inputs = {
    nixpkgs.url =  "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows =  "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
              nixpkgs.follows = "nixpkgs";
              home-manager.follows = "home-manager";
      };	
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixcord.url = "github:FlameFlag/nixcord";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager

        inputs.stylix.nixosModules.stylix

        {
                home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;	
                        extraSpecialArgs =  { inherit inputs; };
                        users.raphael = import ./home/raphael.nix;
                };
        }
      ];
    };
  };
}
