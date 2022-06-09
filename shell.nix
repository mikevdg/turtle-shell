{ pkgs ? import <nixpkgs> {} }:
let myGhc = pkgs.haskellPackages.ghcWithPackages (hpkgs: with hpkgs; [
      turtle
      flow
    ]);
in
pkgs.mkShell {
  buildInputs = [ 
    myGhc
    pkgs.haskellPackages.cabal-install
    pkgs.haskellPackages.haskell-language-server
  ];
}