-- Main.hs
import MyFFI

main :: IO ()
main = do
    -- 创建 Calculator 对象
    calculator <- createCalculator
    
    -- 使用 Calculator 对象进行加法运算
    result <- calculatorAdd calculator 10 20
    putStrLn $ "10 + 20 = " ++ show result
    
    -- 销毁 Calculator 对象
    destroyCalculator calculator
