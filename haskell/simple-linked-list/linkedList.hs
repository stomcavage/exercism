module LinkedList where

data Node a = Nil | Element a (Node a)
    deriving (Show)

new :: a -> Node a -> Node a
new = Element 

nil :: Node a
nil = Nil

isNil :: Node a -> Bool
isNil Nil = True
isNil _   = False

datum :: Node a -> a
datum (Element e _) = e
datum Nil           = error "datum invalid on Nil"

next :: Node a -> Node a
next (Element _ node) = node
next Nil              = error "next invalid on Nil"

toList :: Node a -> [a]
toList (Element e node) = e : toList node
toList Nil              = []

fromList :: [a] -> Node a
fromList = foldr new Nil 

reverseLinkedList :: Node a -> Node a
reverseLinkedList n = fromList $ reverse $ toList n 
