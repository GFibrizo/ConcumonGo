-- Main.hs, final code
module Main where

import qualified ConcumonGo (main)
import qualified Threads (main)
import qualified MVars (main)
import qualified MVarSharedState (main)
import qualified Channels (main)
import qualified DuplicatingChannels (main)
import qualified Entrada (main)


-- The main entry point.
main :: IO ()
main = do
    example "Threads" Threads.main
    example "MVar" MVars.main
    example "Shared state" MVarSharedState.main
    example "Channels" Channels.main
    example "Duplicating channels" DuplicatingChannels.main
    example "Jugadores arrivando" Entrada.main
    example "Cazar concumones interactivo" ConcumonGo.main

example title code = do
    putStrLn ("~~~ Running " ++ title ++ " example! ~~~")
    code
    putStrLn ""