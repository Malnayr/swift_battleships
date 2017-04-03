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
  //The amount of hits the ship has taken
  var hitCount : Int = 0
  //Determine if ship is horizontal(0) or vertical(1)
  //srand( UInt32( time( nil ) ) )
  //var axis : Int = random()%2
  var direction : Int
  //Where the ship is located on the board
  var position : Int

  public init(size : Int, symbol : String, name : String)
  {
      self.size = size
      self.symbol = symbol
      self.name = name
      self.direction = genDirection()
  }

  public func genShip()
  {
    var shipID = random()%3
    switch (shipID)
    {
      case 0 :
      case 1 :
      case 2 :
      default :
    }
    //Return Ship
  }

  public func genDirection()
  {
    //North(0), East(1), South(2), West(3)
    direction = random()%4
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
