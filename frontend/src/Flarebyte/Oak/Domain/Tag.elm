module Flarebyte.Oak.Domain.Tag exposing (Tag, TagState, reset, resetState)



type StateTagName = 

  StateStartTagName
  | StateAcceptableTagName
  | StateTooLongTagName


type StateTagDescription = 

  StateStartTagDescription
  | StateAcceptableTagDescription
  | StateTooLongTagDescription

type alias Tag = 
  {
   name: String
    ,description: String
  }

type alias TagState = 
  {
   name: StateTagName
    ,description: StateTagDescription
  }
reset: Tag 
reset = 
  {
   name= ""
    ,description= ""
  }

resetState: TagState 
resetState = 
  {
   name= StateStartTagName
    ,description= StateStartTagDescription
  }
