{
  description = "C/C++ Development Environment";

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
          gcc
          gnumake
          cmake
          gdb
          valgrind
          clang-tools
          cpplint
        ];

        shellHook = ''
          echo "> C/C++ Dev Shell "
          echo "Tools: gcc $(gcc --version | head -n1), make $(make --version | head -n1)"
        '';
      };
    };
}
