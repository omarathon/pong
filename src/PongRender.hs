module PongRender(render) where

import Graphics.Gloss
import PongData
import PongConstants

-- draw a PongGame state (convert it to a picture)
render :: PongGame -- ^ the game state to render 
       -> Picture  -- ^ a picture of the game state


-- primitive objects
ball, paddle, wall :: Picture
ball = color ballColour $ circleSolid ballRadius
paddle = color paddleColour $ rectangleSolid paddleWidth paddleHeight
wall = color wallColour $ rectangleSolid wallWidth wallHeight


mkWall :: Float -> Picture -- generate a wall at the given vertical offset
mkWall verticalOffset = translate 0 verticalOffset wall

walls :: Picture
walls = pictures [mkWall wall1Y, mkWall wall2Y]

mkPaddle :: Color -> Float -> Float -> Picture -- generate a paddle with an outline of the given colour at the given x, y positions
mkPaddle borderColour x y = pictures [
    translate x y $ color borderColour $ rectangleSolid (paddleWidth + 2 * paddleBorderRadius) (paddleHeight + 2 * paddleBorderRadius),
    translate x y paddle
    ] 

render game =
    pictures
    [
        uncurry translate (ballLoc game) ball,
        walls,
        mkPaddle p1PaddleColour paddle1X (player1PaddleOffset game),
        mkPaddle p1PaddleColour paddle2X (player2PaddleOffset game)
    ]
