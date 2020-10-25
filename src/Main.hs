module Main(main) where

import Graphics.Gloss
import PongData
import PongRender
import PongConstants
import PongAnimate

-- window definition
window :: Display
window = InWindow "Pong" (windowWidth, windowHeight) (windowOffset, windowOffset)

-- main
main :: IO ()
main = animate window backgroundColour frame
    where
        frame :: Float -> Picture
        frame seconds = render $ moveBall seconds initialState