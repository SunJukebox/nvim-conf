{
  description = "Flake exporting a configured neovim package";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    mnw.url = "github:gerg-l/mnw";
  };
  outputs = { self, nixpkgs, mnw, ... }@inputs:
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
        in 
        {
          default = self.packages.${system}.neovim;
          dev = self.packages.${system}.default.devMode;

          neovim = mnw.lib.wrap { inherit pkgs inputs; } ./config.nix;
        }
      );
    };
}
