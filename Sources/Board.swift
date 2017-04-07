/*
  filename: Board.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/

import Foundation

public class Board
{
  //Store all the ships that belong to the board
  var ships = [Ship]()
  //Board that will be displayed to the user
  var board = [[String]]()
  //takenCoords used for debugging to see if appropriate positions are taken
  var takenCoords = [[Int]]()
  //Array that hold coords that the user has picked
  var chosenCoord = [[Int]]()
  //Coordinate choices that will be displayed to the user on the board
  var vCoords = ["A","B","C","D","E","F","G","H","I","J"]
  var hCoords = ["1","2","3","4","5","6","7","8","9","10"]

  /*
    Purpose: Initialize the board
    Params: None
    Return: None
  */
  public init()
  {
    //Create a 10 x 10 two dimensional array - each position is set to '*'
    self.board = [[String]](repeating:[String](repeating:"*", count:10), count:10)
  }

  /*
    Purpose: Print/display the board to the user
    Params: None
    Return: None
  */
  public func displayBoard()
  {
    //Index to keep track of to vCoords value
    var vIndex : Int = 0
    //String that stores board string
    //Initially holds hCoords that are separated
    var boardString : String = "  \(hCoords.joined(separator:"  "))\n"

    //Loop through each row inside board
    for row in board
    {
      //Add vCoord to board string
      boardString += vCoords[vIndex]
      //Loop through each column
      for column in row
      {
        //Add column value into board string
        //<space>symbol<space>
        boardString += " \(column) "
      }
      boardString += "\n"
      vIndex += 1
    }
    //print board string
    print(boardString)
  }

  /*
    Purpose: Initialize ships that will be displayed on the board
    Params: None
    Return: None
  */
  public func placeShipsOnBoard()
  {
    //Set random values truly random
    srand( UInt32( time( nil ) ) )
    //index for keeping track of where ship is
    var index = 0
    //Keep track if a collision has occured
    var collisionDetected : Bool
    //While ships array doesn't equal 5
    while(ships.count != 5)
    {
      //Initialize variables
      collisionDetected = false
      let shipID = random()%3
      //Generate Ship based on shipID
      ships.append(genShip(shipID : shipID))
      index = ships.count - 1
      let currentShip = ships[index]

      //Loop through every coordinates in ship
      for coord in currentShip.coordinates
      {
        //See if Ship coordinates belong in takenCoords
        collisionDetected = !takenCoords.contains{$0 == coord} ? collisionDetected : true
      }

      //If collision occured
      if (collisionDetected)
      {
        //Remove ship from ships - this will ensure that the while loop will Loop
        //again for a new ship that doesn't collide with other ships
        ships.remove(at: index)
      }
      else
      {
        //If no collisions occured add all ship coordinates into takenCoords
        for coord in currentShip.coordinates
        {
            takenCoords.append(coord)
        }
      }
    }
  }
  /*
    Purpose: Function that randomly generates a ship, and intial coordinates that
             it will be places on
    Params: shipID - The id to determine what ship to create
    Return: Returns Ship
  */
  //Use this to generate ships randomly
  public func genShip(shipID : Int) -> Ship
  {
    //Variables that specify the initial coordinate the ship will be placed in
    let vInitialCoord = random()%10
    let hInitialCoord = random()%10
    //Optional ship variable
    var ship : Ship?
    //Create ship based on what shipID was passed in
    switch (shipID)
    {
      case 0 : ship = TugBoat(coordinates : [[vInitialCoord,hInitialCoord]])
      case 1 : ship = Submarine(coordinates : [[vInitialCoord,hInitialCoord]])
      case 2 : ship = ACCarrier(coordinates : [[vInitialCoord,hInitialCoord]])
      default : print("Cannot generate ship.")
    }
    //Unwrap and return the ship
    return ship!
  }

  /*
    Purpose: Check if user's coordinate match a ship's coordinate on the board
    Params: userCoord - User's input on where to check for ship
    Return: None
  */
  public func checkCoords(userCoord : [Int])
  {
      //Variable to determine if ship was hit
      var isHit : Bool = false
      //Index to keep track of where the ship is in ships array
      var index : Int = 0;
      //Check if user already passed in the same coordinate
      if (chosenCoord.contains{(where: $0 == userCoord)})
      {
        print("You this spot already! Pick a new spot.")
      }
      else
      {
        //Loop through all ships
        for ship in ships
        {
          //Check if user's coordinate hit a ship
          isHit = ship.checkHit(userCoord : userCoord)
          //If it was hit them replace the value on the board with the ship symbol
          if(isHit)
          {
            board[userCoord[0]][userCoord[1]] = ship.symbol
            //Add user's coord into chosenCoord array
            chosenCoord.append(userCoord)
            //display hit message
            hit()
            //Check if ship is destoryed - if it is remove it from ships array
            if(ship.isDestoryed)
            {
              ships.remove(at: index)
            }
            //break from loop since it hit a ship
            break
          }
          else
          {
            //If no ship were hit set the value on the board as a space
            board[userCoord[0]][userCoord[1]] = " "
          }
          //Increment index 
          index += 1
        }
        //If user's coordinates is a space, display miss message
        if(board[userCoord[0]][userCoord[1]] == " ")
        {
          miss()
        }
      }
  }

  //Print function that prints miss message
  public func miss()
  {
    print("You missed!!")
    print("")
    print("MM     MM II SSSSSSS SSSSSSS !!")
    print("M M   M M II SS      SS      !!")
    print("M   M   M II SSSSSSS SSSSSSS !!")
    print("M       M II      SS      SS   ")
    print("M       M II SSSSSSS SSSSSSS !!\n")
  }

  //Print function that prints hit message
  public func hit()
  {
    print("")
    print("HH     HH II TTTTTTTTTT !!")
    print("HH     HH II     TT     !!")
    print("HHHHHHHHH II     TT     !!")
    print("HH     HH II     TT       ")
    print("HH     HH II     TT     !!\n")
  }

  //Debug function to display the ship coordintes
  public func displayAnswers()
  {
    for ship in ships
    {
      print("Name: \(ship.name)")
      switch(ship.direction)
      {
      case 0: print("Direction: North")
      case 1: print("Direction: East")
      case 2: print("Direction: South")
      case 3: print("Direction: West")
      default: print("")
      }
      print("Coordinates: \(ship.coordinates)")
    }
    print("Taken Coords: \(takenCoords)")
  }
}
