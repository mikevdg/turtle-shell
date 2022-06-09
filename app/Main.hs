{-# LANGUAGE OverloadedStrings #-}

module Main where

import Turtle
import Flow

main :: IO ()
main = sh $ do
    ls "." |> view
