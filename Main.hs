module Main(main) where

import Graphics.Gloss

window :: Display
window = InWindow "Hello World!" (500, 500) (500, 500)

background :: Color
background = white

drawing :: Picture
drawing = circle 80

main :: IO ()
main = display window background drawing