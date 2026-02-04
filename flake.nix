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
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
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
            ./home.nix
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
            ./home.nix
          ];
        };

      };
    };
}
