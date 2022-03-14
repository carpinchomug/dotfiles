{
  description = "Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }@inputs: {
    homeConfigurations.akiyoshi =
      let
        system = "x86_64-linux";
        username = "akiyoshi";

      in
      home-manager.lib.homeManagerConfiguration {
        inherit system username;

        homeDirectory = "/home/${username}";

        # Update the state version as needed.
        # See the changelog here:
        # https://nix-community.github.io/home-manager/release-notes.html#sec-release-21.05
        stateVersion = "21.11";

        # Specify the path to your home configuration here
        configuration = {
          imports = [ ./modules ];

          nixpkgs = {
            config.allowUnfree = true;
          };

          # Let Home Manager install and manage itself.
          programs.home-manager.enable = true;
        };

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit inputs system;
        };
      };
  };
}
