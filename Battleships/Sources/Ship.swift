import Foundation

public class Ship
{
  //Size of the ship
  var size : Int

  //Attribute to check if ship is destoryed
  var isDestoryed : Bool = false

  //String that represents the ship
  var symbol : String

  //Name of the ship
  var name : String

  //Determine if ship is facing North, East, South, or West
  var direction : Int

  //Where the ship is located on the board
  //var coordinates = Coordinate[]()
  var coordinates : [[Int]]

  public init(size : Int, symbol : String, name : String, coordinates : [[Int]])
  {
      self.size = size
      self.symbol = symbol
      self.name = name
      self.direction = random()%4
      self.coordinates = coordinates
      self.placeShip()
  }

  public func genDirection()
  {
    //North(0), East(1), South(2), West(3)
    srand( UInt32( time( nil ) ) )
    return direction = random()%4
  }

  public func checkHit(userCoord : [Int])
  {
    if (!isDestoryed)
    {
      for coord in self.coordinates
      {
        if(coord == userCoord)
        {
          size -= 1
          print("The \(name) has been hit!")
          //remove the index that has been hit from the ship coordinate array
          self.coordinates = self.coordinates.filter(){ $0 != coord }
        }
        if(self.coordinates.count == 0)
        {
          isDestoryed = true
          print("The \(name) has been destoryed!")
        }
      }
    }
  }

  public func placeShip()
  {
    var initialCoord = coordinates[0]
    //North(0), East(1), South(2), West(3)
    switch(self.direction)
    {
    case 0:
      if(initialCoord[0] + self.size > 9)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0] + index)
          coord.append(initialCoord[1])
          coordinates.append(coord)
        }
      }
    case 1:
      if(initialCoord[1] + self.size > 9)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0])
          coord.append(initialCoord[1] + index)
          coordinates.append(coord)
        }
      }
    case 2:
      if(initialCoord[0] - self.size < 0)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0] - index)
          coord.append(initialCoord[1])
          coordinates.append(coord)
        }
      }
    case 3:
      if(initialCoord[1] - self.size < 0)
      {
        self.genDirection()
        self.placeShip()
      }
      else
      {
        for index in 1..<self.size
        {
          var coord = [Int]()
          coord.append(initialCoord[0])
          coord.append(initialCoord[1] - index)
          coordinates.append(coord)
        }
      }
    default:
      print("Dead.")
    }
  }


}
