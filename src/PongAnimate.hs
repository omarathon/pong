module PongAnimate where

import Graphics.Gloss
import PongData

-- | Update the ball position using its current velocity.
moveBall :: Float    -- ^ The number of seconds since last update
         -> PongGame -- ^ The initial game state
         -> PongGame -- ^ A new game state with an updated ball position

moveBall seconds game = game { ballLoc = (x', y') }
    where
        -- old locations and velocities
        (x, y) = ballLoc game
        (vx, vy) = ballVel game

        -- new locations
        x' = x + vx * seconds
        y' = y + vy * seconds