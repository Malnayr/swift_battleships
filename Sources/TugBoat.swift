/*
  filename: TugBoat.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/
public class TugBoat : Ship
{
  /*
    Purpose:
  */
  public init(coordinates : [[Int]])
  {
    super.init(size : 2, symbol : "Ӝ", name : "Tug Boat", coordinates : coordinates)
  }
}
