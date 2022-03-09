module Main where


--Ignore this diagrams spesifc stuff
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Backend.SVG.CmdLine
import Diagrams.Prelude

-- Interesting things start here:

serp :: Int -> Diagram B -- here we are saying that serp
                         -- takes a whole number and returns a diagram
serp level -- here we call that whole number level
  | level <= 1 = triangle 1 # fc aqua -- if level is less than or equal to one
                                      -- return a triangle
 -- otheriwse return a "shape" over two other "shape"s
  | otherwise =      shape
                      === --this operator could be read as but above
               (shape ||| shape) # centerX -- the ||| operator means put next to
                                           -- the # operator could be read as
                                           -- with property
                                           -- so this would be put "shape" next
                                           -- to "shape" and center the result
  where
    shape = serp (level - 1) --here we say that shape is equal to a
                             -- Sierpiński triangle
                             -- with one level of detail lower

main :: IO ()
main = mainWith $ serp 7
