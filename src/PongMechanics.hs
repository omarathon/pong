module PongMechanics where

import Graphics.Gloss
import PongData
import PongConstants

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

-- | Detect a collision with a paddle. Upon collisions,
-- change the velocity of the ball to bounce it off the paddle.
paddleBounce :: PongGame -> PongGame

-- | Given position of the ball, and the y coordinate of the left and right paddle respectively, return whether a collision occured with a paddle.
paddleCollision :: Position -> Float -> Float -> Bool
paddleCollision (x, y) paddle1Y paddle2Y = paddle1Collision || paddle2Collision
    where
        paddle1Collision = 
            x - ballRadius <= paddle1X + fromIntegral paddleWidthFullRadius 
            && paddleYCollision paddle1Y
            
        paddle2Collision =
            x + ballRadius >= paddle2X - fromIntegral paddleWidthFullRadius
            && paddleYCollision paddle2Y

        paddleYCollision paddleY = -- whether the y component of the ball collided with a given y component of the center of a paddle
            y + ballRadius >= paddleY - fromIntegral paddleHeightFullRadius
            && y - ballRadius <= paddleY + fromIntegral paddleHeightFullRadius

paddleBounce game = game { ballVel = (vx', vy) }
    where
        (vx, vy) = ballVel game -- old velocities
        vx' = if paddleCollision (ballLoc game) (player1PaddleOffset game) (player2PaddleOffset game) then -vx -- if collided with a paddle then invert x velocity
              else vx -- did not collide with a paddle, so leave the velocity unchanged
        

-- | Detect a collision with one of the side walls. Upon collisions,
-- update the velocity of the ball to bounce it off the wall.
wallBounce :: PongGame -> PongGame

-- | Given position of the ball, return whether a collision occurred with a wall.
wallCollision :: Position -> Bool
wallCollision (_, y) = topCollision || bottomCollision
    where
        topCollision = y + ballRadius >= fromIntegral windowHeightRadius -- y + ballRadius is vertical distance from center of the screen to the top of the ball
        bottomCollision = y - ballRadius <= -(fromIntegral windowHeightRadius) -- y - ballRadius is the vertical distance from the center of the screen to the bottom of the ball

wallBounce game = game { ballVel = (vx, vy') }
    where
        (vx, vy) = ballVel game -- old velocities
        vy' = if wallCollision (ballLoc game) then -vy -- if collided with wall, invert the y velocity
              else vy -- did not collide with the wall, so leave the velocity unchanged