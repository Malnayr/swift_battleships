public class Board
{
  //Empty 2D array
  var board = [[Ship?]]()
  var vCoords = ["A","B","C","D","E","F","G","H","I","J"]
  var hCoords = ["1","2","3","4","5","6","7","8","9","10"]

  public init()
  {
    //Create a 10 x 10 two dimensional array
    self.board = [[Ship?]](repeating:[Ship?](repeating:nil, count:10), count:10)
  }

  public func displayBoard()
  {
    //for each row in board
      //for each column in row
        //
    for row in board
    {
      for column in row
      {
        print("*")
      }
    }
  }

}
