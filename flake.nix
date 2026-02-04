{
  description = "Home Manager configuration of justinb";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs: # <- this `@inputs` will expose the block of code below, to the inputs that you set above.
    let
      # ---- System Settings ---- #
      system = "x86_64-linux";
      locale = "en_CA.UTF-8";
      timezone = "America/Toronto";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # This is the section of the `flake.nix` that is responsible for importing and configuring the `configuration.nix`
      nixosConfigurations = {
        sol-server = nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            # `inherit` is used to pass the variables set in the above "let" statement into our configuration.nix file below
            inherit inputs timezone locale;
          };

          modules = [
            # Our main nixos configuration file
            # This is the file where we compartmentalize the changes we want to make on a system level
            ./system/sol-server/configuration.nix
          ];
        };
      };

      # home-manager configuration entrypoint
      # Available through 'home-manager --flake .
      homeConfigurations = {
        "justinb" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          # extraSpecialArgs = { };

          modules = [
            {
              home = {
                # Home Manager needs a bit of information about you and the paths it should
                # manage.
                username = "justinb";
                homeDirectory = "/home/justinb";
                # Don't change this value
                stateVersion = "25.11";
              };
            }
            ./home-manager/home.nix
          ];

        };

        "wearable-avionics" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            {
              home = {
                username = "wearable-avionics";
                homeDirectory = "/home/wearable-avionics";
                # Don't change this value
                stateVersion = "25.11";
              };
            }
            ./home-manager/home.nix
          ];
        };

        "sol" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            {
              home = {
                username = "sol";
                homeDirectory = "/home/sol";
                # Don't change this value
                stateVersion = "25.11";
              };
            }
            ./home-manager/home-sol-server.nix
          ];
        };

      };
    };
}
