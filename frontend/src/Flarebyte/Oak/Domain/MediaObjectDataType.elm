module Flarebyte.Oak.Domain.MediaObjectDataType exposing (MediaObjectDataType, MediaObjectDataTypeState, reset, resetState)



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
