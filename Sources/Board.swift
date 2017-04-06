import Foundation

public class Board
{
  var ships = [Ship]()
  //Empty 2D array
  var board = [[String]]()
  var takenCoords = [[Int]]()
  var vCoords = ["A","B","C","D","E","F","G","H","I","J"]
  var hCoords = ["1","2","3","4","5","6","7","8","9","10"]

  public init()
  {
    //Create a 10 x 10 two dimensional array
    self.board = [[String]](repeating:[String](repeating:"*", count:10), count:10)
    placeShipsOnBoard()
    for ship in ships
    {
      print("Name: \(ship.name)")
      print("Direction: \(ship.direction)")
      print("Coordinates: \(ship.coordinates)")
    }
    print("Taken Coords: \(takenCoords)")
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
        boardString += " \(column)"
      }
      boardString += "\n"
      vIndex += 1
    }
    print(boardString)
  }

  public func placeShipsOnBoard()
  {
    srand( UInt32( time( nil ) ) )
    var index = 0
    while(ships.count <= 5)
    {
      var collisionDetected = false
      let shipID = random()%3
      ships.append(genShip(shipID : shipID))
      let currentShip = ships[index]

      for coord in currentShip.coordinates
      {
        if !takenCoords.contains{ $0 == coord }
        {
          takenCoords.append(coord)
        }
        else
        {
          collisionDetected = true
        }
      }

      if (collisionDetected)
      {
        //remove ship from ships
        ships.remove(at: index)
        index -= 1
      }
      else
      {
        //initialize ships onto the board
        //var shipCoord = ships[index].coordinates[0]
        //give the ships a masking symbol until player calls position
        //board[shipCoord[0]][shipCoord[1]] = ships[index].symbol
        for shipCoord in ships[index].coordinates
        {
          board[shipCoord[0]][shipCoord[1]] = ships[index].symbol
        }
      }
      index += 1
    }


  }
  //Use this to generate ships randomly
  public func genShip(shipID : Int) -> Ship
  {
    let vInitialCoord = random()%10
    let hInitialCoord = random()%10
    var ship : Ship?
    switch (shipID)
    {
      //generate ship coordinates before you create the Ship
      //Then pass in the coordinates
    case 0 : ship = TugBoat(coordinates : [[vInitialCoord,hInitialCoord]])
    case 1 : ship = Submarine(coordinates : [[vInitialCoord,hInitialCoord]])
    case 2 : ship = ACCarrier(coordinates : [[vInitialCoord,hInitialCoord]])
      default : print("Broke in Board.swift:genShip method.")
    }
    return ship!
  }
}
