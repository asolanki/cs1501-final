module Paths_Life (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/Adarsh/Library/Haskell/ghc-7.4.2/lib/Life-0.1.0.0/bin"
libdir     = "/Users/Adarsh/Library/Haskell/ghc-7.4.2/lib/Life-0.1.0.0/lib"
datadir    = "/Users/Adarsh/Library/Haskell/ghc-7.4.2/lib/Life-0.1.0.0/share"
libexecdir = "/Users/Adarsh/Library/Haskell/ghc-7.4.2/lib/Life-0.1.0.0/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "Life_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Life_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Life_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Life_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
