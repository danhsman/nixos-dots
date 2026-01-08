{
  description = "Python Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          (python3.withPackages (ps: with ps; [
            # pandas
            # requests
            # numpy
          ]))
          black
          isort
          pylint
          pyright
        ];

        shellHook = ''
          echo " Python Development Shell"
          echo "Python $(python --version)"
        '';
      };
    };
}
