import Control.Monad
import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util



main :: IO ()
main = shakeArgs shakeOptions $ do
  forM_ ["build", "push"] $ \target -> do
    target ~> do
      forM_ ["common", "master", "agent"] $ \d -> do
        unit $ cmd Shell "cd" d "&& rake" target
