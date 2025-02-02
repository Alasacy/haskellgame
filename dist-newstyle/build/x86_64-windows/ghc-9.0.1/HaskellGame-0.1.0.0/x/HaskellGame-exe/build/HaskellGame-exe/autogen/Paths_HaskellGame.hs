{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_HaskellGame (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\cabal\\bin"
libdir     = "C:\\cabal\\x86_64-windows-ghc-9.0.1\\HaskellGame-0.1.0.0-inplace-HaskellGame-exe"
dynlibdir  = "C:\\cabal\\x86_64-windows-ghc-9.0.1"
datadir    = "C:\\cabal\\x86_64-windows-ghc-9.0.1\\HaskellGame-0.1.0.0"
libexecdir = "C:\\cabal\\HaskellGame-0.1.0.0-inplace-HaskellGame-exe\\x86_64-windows-ghc-9.0.1\\HaskellGame-0.1.0.0"
sysconfdir = "C:\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "HaskellGame_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "HaskellGame_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "HaskellGame_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "HaskellGame_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "HaskellGame_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "HaskellGame_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
