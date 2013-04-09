module Life where

import Data.List
import Control.Monad
-- import Conrol.Concurrent (threadDelay)
-- import System.Console.ANSI (clearscreen)

-- board for the game is a 2d-array of Bool's
type Board = [[Bool]]
data Game = Game {
	gameBoard  :: Board,
	iterations :: Integer
}

numberOfNeighbors :: Game -> (Int, Int) -> Int
numberOfNeighbors = 

surrounding :: Game -> (Int, Int) -> [Bool]
surrounding g (x, y) = case (x, y) of
	(0, 0) 		-> (board !! y) !! x)

