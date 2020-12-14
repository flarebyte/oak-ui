module Flarebyte.Oak.Domain.WorkProgression exposing (WorkProgression, reset)




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
