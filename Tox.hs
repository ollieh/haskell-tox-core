{-# LANGUAGE ForeignFunctionInterface #-}
import Foreign
import Foreign.Ptr
import Foreign.C.Types

-- | Uninspectable data type for the Tox struct
data Tox

foreign import ccall "tox.h tox_new"
    c_tox_new :: CUInt -> Ptr Tox

-- | Call on startup, returns a pointer to a tox struct, if ipv6 is
-- True then tox runs in ipv6 mode.
toxNew :: Bool -> Ptr Tox
toxNew ipv6 = case (ipv6) of
                  True -> c_tox_new $ fromIntegral 1
                  False -> c_tox_new $ fromIntegral 0

main :: IO ()
main = do
        let tox = toxNew False
        putStrLn "Finished"