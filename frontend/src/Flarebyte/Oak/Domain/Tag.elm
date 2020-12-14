module Flarebyte.Oak.Domain.Tag exposing (Tag, TagState, TagAndState, reset, resetState)



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

type alias TagAndState = 
  {
   value: Tag
    ,state: TagState
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
validateTagName: String -> StateTagName
validateTagName value=
    if String.length value == 0 then
          StateStartTagName
      else if String.length value > 50 then
         StateTooLongTagName
      else
          StateAcceptableTagName
