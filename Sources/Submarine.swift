public class Submarine : Ship
{
  var size : Int = 3
  var symbol : String = "Ө"
  var name : String = "Submarine"
  public override init(size : Int, symbol : String, name : String)
  {
    super.init(size : size, symbol : symbol, name : name)
  }
}
