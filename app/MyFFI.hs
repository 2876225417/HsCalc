-- MyFFI.hs
{-# LANGUAGE ForeignFunctionInterface #-}

module MyFFI where

import Foreign.C.Types
import Foreign.Ptr (Ptr)
import Foreign.Marshal.Alloc (free)

-- 引入 C++ 包装函数
foreign import ccall "create_calculator" c_create_calculator :: IO (Ptr ())
foreign import ccall "destroy_calculator" c_destroy_calculator :: Ptr () -> IO ()
foreign import ccall "calculator_add" c_calculator_add :: Ptr () -> CInt -> CInt -> IO CInt

-- Haskell 中对 Calculator 的封装
data Calculator = Calculator (Ptr ())

-- 创建 Calculator 对象
createCalculator :: IO Calculator
createCalculator = do
    calcPtr <- c_create_calculator
    return (Calculator calcPtr)

-- 销毁 Calculator 对象
destroyCalculator :: Calculator -> IO ()
destroyCalculator (Calculator calcPtr) = c_destroy_calculator calcPtr

-- 使用 Calculator 进行加法运算
calculatorAdd :: Calculator -> Int -> Int -> IO Int
calculatorAdd (Calculator calcPtr) x y = do
    result <- c_calculator_add calcPtr (fromIntegral x) (fromIntegral y)
    return (fromIntegral result)
