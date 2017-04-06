/*
  filename: ACCarrier.swift
  author: Ryan Lam (CST215) & Joe Lam (CST234)
  date: 4/6/2017
*/

public class ACCarrier : Ship
{
  /*
    Purpose:
  */
  public init(coordinates : [[Int]])
  {
    super.init(size : 4, symbol : "Ш", name : "Air Craft Carrier", coordinates : coordinates)
  }
}
