import Test.QuickCheck

--1.-The Maximum Function--------------------------------------------------
maxi :: Ord a => a -> a -> a
maxi x y | x >= y    = x
         | otherwise = y

-- Two cases:
--maxi x y returnerar antingen x eller y
prop_maxi_rightValue :: Int -> Int -> Bool
prop_maxi_rightValue x y = maxi x y == x || maxi x y == y

--maxi x y returnerar ett värde större eller lika med båda x och y
prop_maxi_greatOrEq :: Int -> Int -> Bool
prop_maxi_greatOrEq x y = maxi x y >= x && maxi x y >= y

--main metod:
main :: IO ()
main = do
    quickCheck prop_maxi_rightValue
    quickCheck prop_maxi_greatOrEq


--3.-The Towers of Hanoi----------------------------------------------------
-- 1 piece:
-- Smallest piece (n) to post 3.

-- 2 pieces:
-- Smallest piece (n-1) to post 2.
-- Biggest piece (n) to post 3.
-- Smallest piece (n-1) to post 3.

--3 pieces:
    --1st combo:
    -- Smallest piece (n-2) to post 3.
    -- Middle piece (n-1) to post 2.
    -- Smallest piece (n-2) to post 2.

    -- 2nd combo:
    -- Biggest piece (n) to post 3.
    -- first (n-1) rings to post 3.


--Function computing the nr of moves needed to move n rings
hanoi :: Integer -> Integer
hanoi 0 = 0
hanoi n = 2*hanoi (n-1)+1 --(can only move ONE ring at a time)


--6.-Multiplying list elements----------------------------------------------
multiply :: Num a => [a] -> a
multiply []     = 1
multiply (x:xs) = x*multiply xs

prop_multiply :: [Integer] -> Bool
prop_multiply xs = multiply xs == product xs


--9.-Defining Types---------------------------------------------------------
-- Data type Month to represent months

-- Function daysInMonth :: Month -> Integer -> Integer
-- which computes nr of days in a month, given the year to account for
-- leap years.



-- Data type Date, containing a year, month and day

-- Function validDate :: Date -> Bool
-- that returns True if the day in the date lies between 1 and the nr of
-- days in the month.

-- Function tomorrow :: Date -> Date,
-- that computes tomorrow's date for a given date.