-- use https://repl.it/languages/haskell to run

twice :: Int -> Int
twice x = x * 2
-- try in REPL:
-- twice 5
-- :t twice // returns type of `twice`

add :: Int -> Int -> Int
add x y = x + y
-- try in REPL:
-- add 2 3
-- :t add

f :: [Int] -> Int
f (x:xs) = x
-- try in REPL:
-- f [50, 100, 200]
-- f [] // an exception
-- :t f


-- Try in REPL:
-- :k Int // returns kind of a type (i.e., "type of a type")
-- :k Double
-- :k String

-- All these return `*`; read this as "a type"




-- Now change the definition of `f` as follows:
-- remove lines with `{-` and `-}` to uncomment
-- don't forget to remove the "old" definition of `f` above

{-
f :: [Int] -> Maybe Int
f [] = Nothing
f (x:xs) = Just x

-}
-- try in REPL:
-- f [50, 100, 200] // this will return Just 50
-- f [] // this will return Nothing
-- :t f
-- :k Maybe // returns `* -> *`; read this informally as "a type depends on a type"
-- NOTE! Not to be confused with dependent types!



-- Now change the definition of `add` as follows:
-- (remember to remove the "old" definition)

{-
add :: Maybe Int -> Maybe Int -> Maybe Int
add Nothing _ = Nothing
add _ Nothing = Nothing
add (Just x) (Just y) = Just (x + y)
-}

-- try in REPL:
-- add (Just 2) (Just 3)
-- add (f [10, 20]) (f [100, 200])
-- add (f [10, 20]) (f [])




-- Now change the definitions of `f` and `add` as follows:

{-
f :: [Int] -> Either String Int
f [] = Left "No first element!"
f (x:xs) = Right x

add :: Either String Int -> Either String Int -> Either String Int
add (Left x) _ = Left x
add _ (Left y) = Left y
add (Right x) (Right y) = Right (x + y)
-}

-- Try in REPL:
-- f [10, 20, 30] // returns Right 10
-- f [] // returns Left "No first element!"
-- add (Right 10) (Right 20) // returns Right 30
-- add (f [10, 20]) (f []) 
-- :k Either // returns "* -> * -> *"; read this informally as "a type depends on two other types"



-- *** BONUS ***
-- try in REPL:
-- :k Maybe Int
-- :k Either String
-- :k Either String Int
-- :k Either (Maybe Int)
-- :k Either (Maybe Int) (Either Double Double)
-- :k Maybe (Either (Maybe Int) Int)

mul :: Int -> Int -> Int
mul x y = x * y

-- :t mul
-- :t (mul 15)
-- :t mul 15
-- :t mul 15 30
-- :t (add (Right 30))