import Foundation

struct Coordinate {
    var latitude : Int
    var longitude : Int
}

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

  //The amount of hits the ship has taken
  var hitCount : Int = 0

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
  }

  public func genDirection()
  {
    //North(0), East(1), South(2), West(3)
    srand( UInt32( time( nil ) ) )
    return direction = random()%4
  }

  public func hit()
  {
    if isDestoryed == false
    {
      hitCount += 1
      print("The \(name) has been hit!")
    }
  }

  public func dead()
  {
    if hitCount == size
    {
      isDestoryed = true
      print("The \(name) has been destoryed!")
    }
  }

}
