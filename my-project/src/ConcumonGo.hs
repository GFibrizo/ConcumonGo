module ConcumonGo where


import Prelude hiding (Either(..))


type Coordinates = (Int, Int)


data Concumon = Concumon 	{cCoord :: Coordinates
							} deriving (Show)


data Player = Player 	{pCoord :: Coordinates
						,pScore :: Int
						} deriving (Show)


data Grid = Grid 	{gConcumons	:: [Concumon]
					,gPlayer :: Player
					} deriving (Show)
 

emptyGrid = Grid 	{gConcumons = 		[Concumon (1,1)
										,Concumon (2,2)
										,Concumon (4,4)
										]
					,gPlayer = Player 	{pCoord = (0,0)
										,pScore = 0
										}
					}


data Input 	= Up 
			| Down 	
			| Left 
			| Right
			deriving (Show, Eq, Ord)


loadLevel :: IO Grid
loadLevel = return emptyGrid


getInput :: IO Input
getInput = do
	char <- getChar
	case char of 
		'w'	-> return Up
		's'	-> return Down
		'a'	-> return Left
		'd'	-> return Right
		otherwise -> getInput


add :: Coordinates -> Input -> Coordinates
add (x,y) input = 
	case input of
		Up		-> (x	, y-1)
		Down	-> (x 	, y+1)
		Left	-> (x-1	, y)
		Right	-> (x+1	, y)


displayGrid :: Grid -> IO ()
displayGrid = print


movePlayer :: Player -> Input -> Player
movePlayer player input = do
	let coord' = add (pCoord player) input
	Player coord' (pScore player)


isNotAtCoordinate :: Coordinates -> Concumon -> Bool
isNotAtCoordinate coord concumon = cCoord concumon /= coord 


modifyGrid :: Grid -> Input -> Grid
modifyGrid grid input = do
	let player' = movePlayer (gPlayer grid) input
	Grid (filter (isNotAtCoordinate (pCoord player')) (gConcumons grid)) player'


concumonIsAt :: Concumon -> Coordinates -> Bool
concumonIsAt concumon coord = (coord == cCoord concumon)


someConcumonIsAt :: [Concumon] -> Coordinates -> Bool
someConcumonIsAt concumons coord = concumonIsAt (head concumons) coord || someConcumonIsAt (tail concumons) coord


hasConcumon :: Grid -> Coordinates -> Bool
hasConcumon grid coord = someConcumonIsAt (gConcumons grid) coord


main :: IO ()
main = gameLoop =<< loadLevel


gameLoop grid = do
	input <- getInput
	let grid' = modifyGrid grid input
	displayGrid grid'
	gameLoop grid'