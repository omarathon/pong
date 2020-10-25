module Main(main) where

import Graphics.Gloss

-- window properties
width, height, offset :: Int
width = 500
height = 500
offset = 200

-- window definition
window :: Display
window = InWindow "Pong" (width, height) (offset, offset)

-- colours
background, ballColour, paddleColour, wallColour, p1PaddleColour, p2PaddleColour :: Color
background = black
ballColour = dark red
paddleColour = light (light blue)
wallColour = greyN 0.5
p1PaddleColour = rose
p2PaddleColour = orange


-- game configurations
ballRadius, paddleWidth, paddleHeight, wallWidth, wallHeight, paddleBorderRadius :: Float
ballRadius = 30
paddleWidth = 10
paddleHeight = 50
paddleBorderRadius = 3
wallWidth = 550
wallHeight = 15


-- primitive objects
ball, paddle, wall :: Picture
ball = color ballColour $ circleSolid ballRadius
paddle = color paddleColour $ rectangleSolid paddleWidth paddleHeight
wall = color wallColour $ rectangleSolid wallWidth wallHeight


mkWall :: Float -> Picture -- generate a wall at the given vertical offset
mkWall verticalOffset = translate 0 verticalOffset $ wall

mkPaddle :: Color -> Float -> Float -> Picture -- generate a paddle with an outline of the given colour at the given x, y positions
mkPaddle borderColour x y = pictures [
    translate x y $ color borderColour $ rectangleSolid (paddleWidth + 2 * paddleBorderRadius) (paddleHeight + 2 * paddleBorderRadius),
    translate x y paddle
    ] 

-- the image
walls :: Picture
walls = pictures [mkWall 245, mkWall (-245)]

paddles = pictures [mkPaddle p1PaddleColour 230 (-20), mkPaddle p2PaddleColour (-230) 40]

drawing :: Picture
drawing = pictures [ball, walls, paddles]







-- main
main :: IO ()
main = display window background drawing 