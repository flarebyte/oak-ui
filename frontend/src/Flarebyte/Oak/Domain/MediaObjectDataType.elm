module Flarebyte.Oak.Domain.MediaObjectDataType exposing (MediaObjectDataType, MediaObjectDataTypeState, MediaObjectDataTypeAndState, reset, resetState)



type StateMediaObjectDataTypeName = 

  StateStartMediaObjectDataTypeName
  | StateAcceptableMediaObjectDataTypeName
  | StateTooLongMediaObjectDataTypeName


type StateMediaObjectDataTypeDescription = 

  StateStartMediaObjectDataTypeDescription
  | StateAcceptableMediaObjectDataTypeDescription
  | StateTooLongMediaObjectDataTypeDescription

type alias MediaObjectDataType = 
  {
   name: String
    ,description: String
  }

type alias MediaObjectDataTypeState = 
  {
   name: StateMediaObjectDataTypeName
    ,description: StateMediaObjectDataTypeDescription
  }

type alias MediaObjectDataTypeAndState = 
  {
   value: MediaObjectDataType
    ,state: MediaObjectDataTypeState
  }
reset: MediaObjectDataType 
reset = 
  {
   name= ""
    ,description= ""
  }

resetState: MediaObjectDataTypeState 
resetState = 
  {
   name= StateStartMediaObjectDataTypeName
    ,description= StateStartMediaObjectDataTypeDescription
  }
validateMediaObjectDataTypeName: String -> StateMediaObjectDataTypeName
validateMediaObjectDataTypeName value=
    if String.length value == 0 then
          StateStartMediaObjectDataTypeName
      else if String.length value > 50 then
         StateTooLongMediaObjectDataTypeName
      else
          StateAcceptableMediaObjectDataTypeName
