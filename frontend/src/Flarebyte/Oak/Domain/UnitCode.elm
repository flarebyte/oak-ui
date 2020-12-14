module Flarebyte.Oak.Domain.UnitCode exposing (UnitCode, UnitCodeState, UnitCodeAndState, reset, resetState)



type StateUnitCodeName = 

  StateStartUnitCodeName
  | StateAcceptableUnitCodeName
  | StateTooLongUnitCodeName


type StateUnitCodeDescription = 

  StateStartUnitCodeDescription
  | StateAcceptableUnitCodeDescription
  | StateTooLongUnitCodeDescription

type alias UnitCode = 
  {
   name: String
    ,description: String
  }

type alias UnitCodeState = 
  {
   name: StateUnitCodeName
    ,description: StateUnitCodeDescription
  }

type alias UnitCodeAndState = 
  {
   value: UnitCode
    ,state: UnitCodeState
  }
reset: UnitCode 
reset = 
  {
   name= ""
    ,description= ""
  }

resetState: UnitCodeState 
resetState = 
  {
   name= StateStartUnitCodeName
    ,description= StateStartUnitCodeDescription
  }
validateUnitCodeName: String -> StateUnitCodeName
validateUnitCodeName value=
    if String.length value == 0 then
          StateStartUnitCodeName
      else if String.length value > 50 then
         StateTooLongUnitCodeName
      else
          StateAcceptableUnitCodeName


validateUnitCodeDescription: String -> StateUnitCodeDescription
validateUnitCodeDescription value=
    if String.length value == 0 then
          StateStartUnitCodeDescription
      else if String.length value > 50 then
         StateTooLongUnitCodeDescription
      else
          StateAcceptableUnitCodeDescription
