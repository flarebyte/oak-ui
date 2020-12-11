module Flarebyte.Oak.Domain.UnitCode exposing (UnitCode, UnitCodeState, reset, resetState)



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
