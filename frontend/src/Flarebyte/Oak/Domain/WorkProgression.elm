module Flarebyte.Oak.Domain.WorkProgression exposing (WorkProgression, reset)



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
reset: WorkProgression 
reset = 
  {
   workIdentifier= ""
    ,dateModified= "2000-01-01"
  }
