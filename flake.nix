{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    inherit self;
    devShells = {
      x86_64-linux = {
        default = self.devShells.x86_64-linux.njs;
        njs = pkgs.mkShell {
          packages = with pkgs; [
            ffmpeg
            nodejs
            yarn
          ];
        };
      };
    };
  };
}
