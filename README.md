# Turtle-shell template

What you're looking at is a basic template for writing scripts in Haskell using Turtle. 

<https://hackage.haskell.org/package/turtle>

There is a Tutorial available in "Turtle.Tutorial" in that link above.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/gitpod-io/template-nix). Gitpod is an excellent online IDE.

This template uses Nix to manage packages. In any Linux installation or "Windows for Linux" (WSL) on 
Windows 10 or 11, follow the instructions here to install Nix:

<https://nixos.org/download.html>

You also want to install Visual Studio Code:

<https://code.visualstudio.com/>

If you're using Windows, then install the "Remote - WSL" extension. 

Use Git to check out this package:

    $ git clone https://github.com/mikevdg/turtle-shell.git

Enter a Nix shell. A Nix shell will install packages in `/nix`, but only make them available inside that shell. This will install Haskell, Cabal and the haskell packages:

    $ cd turtle-shell
    $ nix-shell

Now you should be able to use Visual Studio with all the IDE features to edit the Haskell code:

    $ code .

Sometimes VS Code and it's Haskell extension stop working. Just restart VS Code.

Press CTRL+d to exit from most command lines.

# Running your code

    $ cabal repl
    ghci> main

If you make changes and need to reload:

    ghci> :r

If you get a runtime error in Haskell, the error you get in the repl does not tell you where the error occurred. To get a stack trace (which doesn't even have line numbers...), try compiling and running the program instead:

    $ cabal run

# Adding more Haskell packages

Search <https://search.nixos.org/packages> for the package you want. Haskell packages have the "haskellPackages" prefix. Then:

#. Add that package to the appropriate place in `turtle-shell.cabal`.
#. Add that package to the appropriate place in `shell.nix`.
#. Add that package as an import in `Main.hs`.
#. Exit, re-enter the nix-shell. 

I know that it's possible to get Nix to be cleverer than this, but I don't want 
to spend time working out how. Feel free to send me a pull request.

# Working with Nix

A warning: Nix is theoretically amazing and practically awful. Learn about it's goals and design, but avoid using it unless you enjoy wasting days on end. Nix isn't there yet. It will serve as an inspiration for some far more usable package manager later.

To search for packages: visit <https://search.nixos.org/packages>.

To install a package globally: 

     $ nix-env -iA nixpkgs.<packageName>

To uninstall a globally installed package:

     $ nix-env -e <packageName>

To see which packages you've installed globally:

    $ nix-env --query

# Why this package exists

Haskell, the language, is mostly okay except for things like "head" on an empty list giving you useless error messages. Haskell, the dev environment, is abysmally bad. This template is a working configuration constructed out of magical incantations discovered through trial and error.

Basically, I want an excuse to use Haskell at work. Scripting is a good use case for that - scripts are short-lived and don't get released. You don't need anybody's permission to write a small script to achieve a one-off goal.

There is a trade-off. For Turtle and Haskell, there is a higher learning curve which can take considerable time to learn (if you've learned monads, you're only half-way there!), but in return you get the vast majority of your errors caught while you type in code, plus auto-completion and documentation under your cursor. You get Turtle's rather fantastic Pattern system for searching, parsing and replacing text. However, I still admit that personally I'm not at the stage yet where a Turtle script can be developed faster than a Python script.

You can copy just the `.hs` file, `chmod +x` it and run it on any system that you have Nix installed on, so long as you put all required packages in the script's header. However, you lose all the IDE 
features of VS Code once the package leaves this directory structure.

# TODO

* Make Haskell print line numbers in stack traces.
* Make ghci print stack traces.
* Get Nix to read Haskell packages from the cabal file.
