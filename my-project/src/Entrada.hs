module Entrada where

import Control.Concurrent (forkIO, threadDelay)
import Data.Foldable (for_)
import Jugador (recibirJugador)

users = 10

main = do
    -- Fork a new thread to do some work in the background.
    recibirJugadores
    -- Wait for threads to finish.
    sleepMs 10


recibirJugadores = for_ [1..users] recibir
    where recibir i = do
            let value = show i
            forkIO (recibirJugador value)

-- A utility function - threadDelay takes microseconds, which is slightly annoying.
sleepMs n = threadDelay (n * 1000)