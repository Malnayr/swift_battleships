import Foundation

public class Ship
{
  //Add coords later
  var size : Int
  var isDestoryed : Bool = false
  var symbol : String
  var hitCount : Int = 0
  var positioin :

  public init(size : Int, symbol : String)
  {
      self.size = size
      self.symbol = symbol
  }

  public hit()
  {
    hitCount += 1
  }

}

public class Submarine : Ship
{
  var size : Int = 3
  var symbol : String = "Ө"
  public override init(size : Int, symbol : String)
  {
    super.init(size : size, symbol : symbol)
  }
}

public class ACarrier : Ship
{
  var size : Int = 4
  var symbol : String = "Ш"
  public override init(size : Int, symbol : String)
  {
    super.init(size : size, symbol : symbol)
  }
}

public class TugBoat : Ship
{
  var size : Int = 2
  var symbol : String = "Ӝ"
  public override init(size : Int, symbol : String)
  {
    super.init(size : size, symbol : symbol)
  }
}
