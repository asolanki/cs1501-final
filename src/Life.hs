module Life where

import Data.List
import Control.Monad
-- import Conrol.Concurrent (threadDelay)
-- import System.Console.ANSI (clearscreen)

-- board for the game is a 2d-array of Bool's
type Board = [[Bool]]
data Game = Game {
	gameBoard :: Board,
	
}