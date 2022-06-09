{ pkgs ? import <nixpkgs> {} }:
let myGhc = pkgs.haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
      # Add any extra Haskell packages you want here:
      turtle
      flow
    ]);
in
pkgs.mkShell {
  buildInputs = [ 
    # Add any other Nix packages you want here:
    myGhc  # Haskell compiler, with the packages above.
    pkgs.haskellPackages.cabal-install # Cabal build tool.
    pkgs.haskellPackages.haskell-language-server # Makes VS Code work like an IDE.
  ];
}