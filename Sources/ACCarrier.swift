public class ACarrier : Ship
{
  var size : Int = 4
  var symbol : String = "Ш"
  var name : String = "Air Craft Carrier"
  public override init(size : Int, symbol : String, name : String)
  {
    super.init(size : size, symbol : symbol, name : name)
  }
}
