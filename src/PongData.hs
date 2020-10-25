module PongData(PongGame(ballLoc, ballVel, player1PaddleOffset, player2PaddleOffset, Game)) where

import Graphics.Gloss

-- | data structure to hold the state of the pong game
data PongGame = Game
    {
        ballLoc :: (Float, Float), -- ^ ball (x,y) location
        ballVel :: (Float, Float), -- ^ ball (x,y) velocity
        player1PaddleOffset :: Float, -- ^ the y position of the top-left of player 1's paddle
        player2PaddleOffset :: Float -- ^ the y position of the top-left of player 2's paddle
    } deriving Show