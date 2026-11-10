{
  description = "Flake exporting a configured neovim package";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    mnw.url = "github:gerg-l/mnw";
  };
  outputs =
    {
      nixpkgs,
      mnw,
      self,
      ...
    }@inputs:
    let
      eachSystem = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.all;
    in
    {
      # define packages flake provides
      packages = eachSystem (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = {
              # Needed for nodjes and some other packages
              allowUnfree = true;
            };
          };

          # point to mnw config in a separate file
          config = import ./config.nix {
            inherit pkgs inputs;
            lib = pkgs.lib;
          };
        in
        {
          # `default' so just `nix run' runs
          default = self.packages.${system}.my-neovim;
          # `dev` is for the development config
          dev = self.packages.${system}.default.devMode;

          my-neovim = mnw.lib.wrap pkgs config;
        }
      );
    };
}
