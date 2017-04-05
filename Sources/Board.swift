public class Board
{
  //Empty 2D array
  var board = [[Ship?]]()
  var vCoords = ["A","B","C","D","E","F","G","H","I","J"]
  var hCoords = ["1","2","3","4","5","6","7","8","9","10"]

  public init()
  {
    //Create a 10 x 10 two dimensional array
    self.board = [[Ship?]]
  }

  subscript (row : Int, column : Int) -> String
  {
    get
    {
      return board[row][column]
    }
    set
    {
      board[row][column] = newValue
    }
  }

}
