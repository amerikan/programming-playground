-- ghc MyLinkedList.hs && ./MyLinkedList

-- interactive mode
-- ghci MyLinkedList.hs

-- To create our own types we use "data" keyword, which also allows recursive types.
-- There's also "type", but that's just a way to create aliases for haskell types
data LinkedList = Node Int (LinkedList) | Empty deriving (Show)

{- we use deriing (Show) to say that it satisfies the Show typeclass
 (aka interfaces, protocols in other languages) -}
{- LinkedList is the type, Node and Empty are type constructors -}

-- denotes the types, usually not needed, but helps find bugs and document the code
addLast :: LinkedList -> Int -> LinkedList
-- below we just pattern match
addLast Empty val = Node val Empty
addLast (Node nval node) val = Node nval (addLast node val) -- recursive call
-- above here we are "destructuring"

addFirst :: LinkedList -> Int -> LinkedList
addFirst Empty val = Node val Empty
addFirst (Node nval node) val = Node val (addFirst node nval)

removeFirst :: LinkedList -> LinkedList
removeFirst Empty = Empty
removeFirst (Node _ node) = node

removeLast :: LinkedList -> LinkedList
removeLast Empty = Empty
removeLast (Node _ Empty) = Empty
removeLast (Node val node) = Node val (removeLast node)

-- haskell optional is called Maybe and is either Nothing or Just something (like None vs Some)
getFirst :: LinkedList -> Maybe Int
getFirst Empty = Nothing
getFirst (Node val node) = Just val

getLast :: LinkedList -> Maybe Int
getLast Empty = Nothing
getLast (Node val Empty) = Just val
getLast (Node val node) = getLast node

display :: LinkedList -> IO()
display Empty = putStrLn ""
display (Node val node) = do
  putStr("[" ++ (show val) ++ "]->")
  display node

main :: IO()
main = do

  {- To not mutate the list and simplify things, I'm just
    returning a new list each time and storing that -}
  let ll1 = Empty
  let ll2 = addLast ll1 4
  let ll3 = addLast ll2 3
  let ll4 = addLast ll3 2
  let ll5 = addLast ll4 1
  let ll6 = addFirst ll5 5
  let ll7 = addFirst ll6 6
  let ll8 = addFirst ll7 7
  -- by the way we only need to add "let" keyword if we are in the main, otherwise
  -- it's not necessary

  let ll9 = removeFirst ll8
  let ll10 = removeLast ll9

  print ll10 -- we can inspect the recursive constructors

  display ll10

  putStrLn("\nFirst Item: " ++ show (getFirst ll10))
  putStrLn("Last Item: " ++ show (getLast ll10))

