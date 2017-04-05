import Foundation

public class Board
{
  var ships = [Ship]()
  //Empty 2D array
  var board = [[Ship?]]()
  var vCoords = ["A","B","C","D","E","F","G","H","I","J"]
  var hCoords = ["1","2","3","4","5","6","7","8","9","10"]

  public init()
  {
    //Create a 10 x 10 two dimensional array
    self.board = [[Ship?]](repeating:[Ship?](repeating:nil, count:10), count:10)
    for _ in 1...5
    {
      srand( UInt32( time( nil ) ) )
      ships.append(genShip())
    }
  }

  public func displayBoard()
  {
    //for each row in board
      //for each column in row
    var vIndex : Int = 0
    var boardString : String = "  \(hCoords.joined(separator:" "))\n"


    for row in board
    {
      boardString += vCoords[vIndex]
      for column in row
      {
        boardString += " *"
      }
      boardString += "\n"
      vIndex += 1
    }
    print(boardString)
  }

  //Use this to generate ships randomly
  public func genShip() -> Ship
  {

    let shipID = random()%3
    var vInitialCoord = random()%10
    var hInitialCoord = random()%10
    var ship : Ship?
    switch (shipID)
    {
      //generate ship coordinates before you create the Ship
      //Then pass in the coordinates
      case 0 : ship = TugBoat(coordinates : [[0,0],[0,1]])
      case 1 : ship = Submarine(coordinates : [[0,2],[0,3],[0,4]])
      case 2 : ship = ACCarrier(coordinates : [[0,5],[0,6],[0,7]])
      default : print()
    }
    return ship!
  }
}
