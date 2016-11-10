module Concumon where

import System.IO
import Control.Concurrent

concumon :: Int -> IO () -> IO ()

    forkIO