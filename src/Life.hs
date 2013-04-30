-- | A console implementation of Conway's Game of Life in Haskell
module Life where

import Data.List
import System.IO
import System.Environment
import Text.Printf
import Control.Monad

-- |Cell type is given by a 2-tuple of integers (x, y)
type Cell = (Int, Int)
-- |Board is the current world of the game, given as a list of living cells
--    in a 20x20 world
type Board = [Cell]

-- |given a board, returns a list of 2-tuples made of each living cell
--    and its number of neighbors
determineNeighbors :: Board         -- ^ The current board
                   -> [(Cell, Int)] -- ^ A list of 2-tuples containing each
                                    --    living cell and its neighbor count
determineNeighbors board = ( map (\xs@(x:_) -> (x, length xs)) . group . sort ) allNeighbors
  where allNeighbors = concatMap (\(x,y) -> map (\(a,b) -> (x+a,y+b)) deltas) board
        deltas = [ (-1,-1), (0,-1), (1,-1), -- the possible deltas for all
                   (-1, 0),         (1, 0), -- possible neighbor cell
                   (-1, 1), (0, 1), (1, 1)] -- positions in the form (dx,dy)

-- |step returns the next iteration of the given board
step :: Board   -- ^ The current board
     -> Board   -- ^ The next board
step b = [c | (c,n) <- determineNeighbors b, alive (c,n)]
  where alive (c,n) = newborn (c,n) || survivor (c,n)
        newborn  ((x,y), n) = notElem (x,y) b && n == 3
        survivor ((x,y), n) = elem (x,y) b && elem n [2,3]

-- |displays a command-line representation of the 20x20 world of cells
--    by mapping over the range and domain [-10..10] checking each cell
--    for membership in the Board (list of living cells)
display :: Board -> IO ()
display board = do
  mapM_ (\x -> do
    mapM_ (\y -> putChar $ if elem (x,y) board then '#' else ' ') [-10..10]
    putChar '\n'
    ) [-10..10]

go :: Board -> Int -> IO ()
go board n = do
  display board
  printf "Steps:%d\n" n
  putStrLn "Enter to continue"
  getLine
  go (step board) (n+1)

-- main function takes input text file and parses living cells
--    format for input: newline separated cells in the form "x y"
main = do
  (filename:_) <- getArgs
  fileLines <- liftM lines $ readFile $ filename
  --let splitLines = map words fileLines
  let tuples = (map (\(x:y:_) -> (read x, read y) ) (map words fileLines))
  putStrLn "Welcome to the Game of Life"
  putStrLn "Press return to begin, and to iterate through each step"
  getLine
  go tuples 0


