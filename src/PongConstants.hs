module PongConstants where

import Graphics.Gloss
import PongData

-- types
type Position = (Float, Float)

-- window properties
windowWidth, windowHeight, windowOffset, fps :: Int
windowWidth = 500
windowWidthRadius = round $ fromIntegral windowWidth / 2
windowHeight = 500
windowHeightRadius = round $ fromIntegral windowHeight / 2
windowOffset = 200
fps = 60

-- | colours
backgroundColour, ballColour, paddleColour, wallColour, p1PaddleColour, p2PaddleColour :: Color
backgroundColour = black
ballColour = dark red
paddleColour = light (light blue)
wallColour = greyN 0.5
p1PaddleColour = rose
p2PaddleColour = orange


-- | game configurations
ballRadius, paddleWidth, paddleHeight, wallWidth, wallHeight, paddleBorderRadius, paddleXOffset, paddle2X, paddle1X, wall1Y, wall2Y :: Float
ballRadius = 30
paddleWidth = 10
paddleWidthFullRadius = 8
paddleHeight = 50
paddleHeightFullRadius = 28
paddleBorderRadius = 3
wallWidth = fromIntegral windowWidth + 50
wallHeight = 15
paddleXOffset = 20
paddle2X = fromIntegral windowWidthRadius - paddleXOffset
paddle1X = -paddle2X
wall1Y = fromIntegral windowWidthRadius - 5
wall2Y = -wall1Y


-- | the starting state of the game
initialState :: PongGame
initialState = Game
  { ballLoc = (0, 0)
  , ballVel = (-30, 9)
  , player1PaddleOffset = 0
  , player2PaddleOffset = 180
  }