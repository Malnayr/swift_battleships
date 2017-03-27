public class Board
{
  //Empty 2D array
  var board = [[String]]()

  public init()
  {
    //Create a 10 x 10 two dimensional array
    for _ in 0..<10
    {
      var rowArray = [String]()
      for _ in 0..<10
      {
        rowArray.append("*")
      }
      board.append(rowArray)
    }
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
