/*
  filename: Game.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/

import Foundation

//Extension for variables that are type Character
//Give it a extension, so it can convert its ascii value to a number
extension Character {
    var asciiValue: UInt32? {
        //look into unicodeScalars and filter out the ascii that matches the
        //Character that is calling this extension and grab its value
        return String(self).unicodeScalars.filter{$0.isASCII}.first?.value
    }
}

public class Game
{
  /*
    Purpose: Start game by creating a new board and Ships. As well as looping
             to ask the user for coordinates, etc.
    Params: None
    Return: None
  */
  public func start()
  {
    //Initialize board
    var board : Board = Board()
    //Create the Ships for the board
    board.placeShipsOnBoard()
    //Variable to see if user wants to keep playing
    var play : Bool = true
    print("\n\nWelcome to Battleships! Made by the Lam fam.")
    //While user still wants to play
    repeat {
        //board.displayAnswers()
        //display board to user
        board.displayBoard()
        //While all ship are not destoryed
        while(board.ships.count > 0)
        {
          //variables for user coordinates
          var row : Int
          var col : Int
          //get user's coordinates
          row = getRow()
          col = getCol()

          print("\n\nYou've decided to fire at: ")
          print("row: \(row), col: \(col)")

          //check if it hit a ship
          board.checkCoords(userCoord: [row,col])
          //display board
          board.displayBoard()
        }
        //Ask if user wants to play again
        play = playAgain()
        if(play)
        {
          //Assign board a new board
          board = Board()
          //Generate new ships for the board
          board.placeShipsOnBoard()
        }
        else
        {
          //Display good bye message
          print("Thank you for playing Command Line Battleships!")
        }
    } while (play)

  }

  /*
    Purpose: Function that is called to ask user if s/he wants to play again
    Params: None
    Return: Returns Bool - True, if user wants to play again, False otherwise.
  */
  public func playAgain() -> Bool
  {
    //Variables
    var bReturn = false
    var answer : String = ""
    print("Congratulations!  You got all the ships.")
    //While user does not specify yes or no
    repeat {
      //Ask and prompt user if they want to play again.
      print("Would you like to play again? (Y/N)")
      answer = readLine()!
      answer = String(answer[answer.startIndex]).lowercased()
      switch (answer) {
        case "y": bReturn = true
        case "n": bReturn = false
        default: answer = ""
      }
    } while (answer == "")

    return bReturn
  }

  /*
    Purpose: Function to call to ask user for a row (x) coordinate. Converts
             character to its ascii value - 64 to get the actual coordinate on
             board
    Params: None
    Return: Return Int - Returns users input as a number
  */
  public func getRow() -> Int
  {
      var row : Int = -1
      //While user doesn't specify a coordinate between A-J
      repeat {
          print("Please enter row (A-J): ")
          var getRow = readLine()!
          //Handles if user enter in a lowercase - it will convert to upper
          getRow = getRow.uppercased()
          //Handles if user enters in a string it will just take the first letter
          let charRow : Character = getRow[getRow.startIndex]
          row = Int(charRow.asciiValue!) - 64
      } while (row <= 0 || row > 10)
      //Return row number with offset of 1
      return row - 1
  }

  /*
    Purpose: Function to call to ask user for column (y) coordinate
    Params: None
    Return: Returns Int - Returns users input as a number
  */
  public func getCol() -> Int
  {
      var col : Int = -1
      //While user doesn't pick a number between 1-10
      repeat {
          print("Please enter column (1-10): ")
          let getCol = readLine()!
          if let temp_col = Int(getCol)
          {
            col = temp_col
          }

      } while (col <= 0 || col > 10)
      //Return column number with offset of 1
      return col - 1
  }
}
