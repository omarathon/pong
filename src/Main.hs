module Main(main) where

import Graphics.Gloss
import Graphics.Gloss.Data.ViewPort

import PongData
import PongRender
import PongMechanics
import PongConstants

-- window definition
window :: Display
window = InWindow "Pong" (windowWidth, windowHeight) (windowOffset, windowOffset)

-- | Update the game by moving the ball and bouncing off walls.
update :: ViewPort -> Float -> PongGame -> PongGame
update _ seconds = paddleBounce . wallBounce . moveBall seconds 

-- main
main :: IO ()
main = simulate window backgroundColour fps initialState render update



-- main = animate window backgroundColour frame
--     where
--         frame :: Float -> Picture
--         frame seconds = render $ moveBall seconds initialState