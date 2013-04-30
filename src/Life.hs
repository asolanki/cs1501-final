-- | A console implementation of Conway's Game of Life in Haskell
module Life where

import Data.List

-- |Cell type is given by a 2-tuple of integers (x, y)
type Cell = (Int, Int)
-- |Board is the current world of the game, given as a list of living cells
type Board = [Cell]

-- |given a board, returns a list of 2-tuples made of each living cell
--    and its number of neighbors
determineNeighbors :: Board         -- ^ The current board
                   -> [(Cell, Int)] -- ^ A list of 2-tuples containing each
                                    --    living cell and its neighbor count
 
determineNeighbors board = map (\xs)
  where allNeighbors = concatMap (\(x,y) -> map (\(a,b) -> (x+a,y+b)) deltas) board
        deltas = [ (-1,-1), (0,-1), (1,-1), -- the possible deltas for all
                   (-1, 0),       , (1, 0), -- possible neighbor cell
                   (-1, 1), (0, 1), (1, 1)] -- positions in the form (dx,dy)
-- |step returns the next iteration of the given board
step :: Board   -- ^ The current board
     -> Board   -- ^ The next board
step b = [c | (c,n) <- determineNeighbors b, alive (c,n)]
  where alive  = newborn || survivor
        newborn  ((x,y), n) = notelem (x,y) b && n == 3
        survivor ((x,y), n) = elem (x,y) b && elem n [2,3]








{-

  -- board for the game is a 20x20 2d-array of Bool's
  type Board = [[Bool]]
  data Game = Game {
  	gameBoard  :: Board,
  	iterations :: Integer
  }


  numberOfNeighbors :: Game -> (Int, Int) -> Int
  numberOfNeighbors g (x,y) = length surrounding g (x,y)

  surrounding :: Game -> (Int, Int) -> [Bool]

-}