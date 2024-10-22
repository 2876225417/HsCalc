{-# LANGUAGE ForeignFunctionInterface #-}

module MyFFI (add) where

import Foreign.C.Types

-- 声明来自 C++ 的 add 函数
foreign import ccall "add" c_add :: CInt -> CInt -> CInt

-- Haskell 中的封装函数
add :: Int -> Int -> Int
add x y = fromIntegral (c_add (fromIntegral x) (fromIntegral y))
