#!/usr/bin/env nix-shell
#!nix-shell --pure -i runghc -p "haskellPackages.ghcWithPackages (pkgs: [ pkgs.turtle pkgs.flow ])"

{-# LANGUAGE OverloadedStrings #-}

module Main where

import Turtle
import Flow

main :: IO ()
main = sh $ do
    ls "." |> view
