module Jugador where


import Control.Concurrent (forkIO, threadDelay)
import Data.Foldable (for_)

recibirJugador id = do
    -- Fork another thread using an inline function!
    putStrLn ("Jugador" ++ id ++ "arrivo")
    recibir id
    putStrLn ("Jugador" ++ id ++ "termino")


recibir id = do for_ [1..10] jugar
    where jugar i = do
            sleepMs 1
            putStrLn ("Jugador" ++ id ++ "Jugando")


-- A utility function - threadDelay takes microseconds, which is slightly annoying.
sleepMs n = threadDelay (n * 1000)