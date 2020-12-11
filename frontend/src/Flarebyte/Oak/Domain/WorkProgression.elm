module Flarebyte.Oak.Domain.WorkProgression exposing (WorkProgression, WorkProgressionState, reset, resetState)



type StateWorkProgressionWorkIdentifier = 

  StateStartWorkProgressionWorkIdentifier
  | StateAcceptableWorkProgressionWorkIdentifier
  | StateTooLongWorkProgressionWorkIdentifier


type StateWorkProgressionDateModified = 

  StateStartWorkProgressionDateModified
  | StateAcceptableWorkProgressionDateModified

type alias WorkProgression = 
  {
   workIdentifier: String
    ,dateModified: String
  }

type alias WorkProgressionState = 
  {
   workIdentifier: StateWorkProgressionWorkIdentifier
    ,dateModified: StateWorkProgressionDateModified
  }
reset: WorkProgression 
reset = 
  {
   workIdentifier= ""
    ,dateModified= "2000-01-01"
  }

resetState: WorkProgressionState 
resetState = 
  {
   workIdentifier= StateStartWorkProgressionWorkIdentifier
    ,dateModified= StateStartWorkProgressionDateModified
  }
