module Flarebyte.Oak.Domain.MediaObject exposing (MediaObject, MediaObjectState, MediaObjectAndState, reset, resetState)

import Flarebyte.Oak.Domain.MediaObjectDataType exposing(MediaObjectDataType)

type StateMediaObjectName = 

  StateStartMediaObjectName
  | StateAcceptableMediaObjectName
  | StateTooLongMediaObjectName


type StateMediaObjectDescription = 

  StateStartMediaObjectDescription
  | StateAcceptableMediaObjectDescription
  | StateTooLongMediaObjectDescription


type StateMediaObjectAbstract = 

  StateStartMediaObjectAbstract
  | StateAcceptableMediaObjectAbstract
  | StateTooLongMediaObjectAbstract


type StateMediaObjectProtectedMediaObjectURL = 

  StateStartMediaObjectProtectedMediaObjectURL
  | StateAcceptableMediaObjectProtectedMediaObjectURL
  | StateTooLongMediaObjectProtectedMediaObjectURL


type StateMediaObjectMediaObjectDataType = 

  StateStartMediaObjectMediaObjectDataType
  | StateAcceptableMediaObjectMediaObjectDataType


type StateMediaObjectRobotCreatorName = 

  StateStartMediaObjectRobotCreatorName
  | StateAcceptableMediaObjectRobotCreatorName
  | StateTooLongMediaObjectRobotCreatorName

type alias MediaObject = 
  {
   name: String
    ,description: String
    ,abstract: String
    ,protectedMediaObjectURL: String
    ,mediaObjectDataType: MediaObjectDataType
    ,robotCreatorName: String
  }

type alias MediaObjectState = 
  {
   name: StateMediaObjectName
    ,description: StateMediaObjectDescription
    ,abstract: StateMediaObjectAbstract
    ,protectedMediaObjectURL: StateMediaObjectProtectedMediaObjectURL
    ,mediaObjectDataType: StateMediaObjectMediaObjectDataType
    ,robotCreatorName: StateMediaObjectRobotCreatorName
  }

type alias MediaObjectAndState = 
  {
   value: MediaObject
    ,state: MediaObjectState
  }
reset: MediaObject 
reset = 
  {
   name= ""
    ,description= ""
    ,abstract= ""
    ,protectedMediaObjectURL= ""
    ,mediaObjectDataType= MediaObjectDataType.reset
    ,robotCreatorName= ""
  }

resetState: MediaObjectState 
resetState = 
  {
   name= StateStartMediaObjectName
    ,description= StateStartMediaObjectDescription
    ,abstract= StateStartMediaObjectAbstract
    ,protectedMediaObjectURL= StateStartMediaObjectProtectedMediaObjectURL
    ,mediaObjectDataType= StateStartMediaObjectMediaObjectDataType
    ,robotCreatorName= StateStartMediaObjectRobotCreatorName
  }
validateMediaObjectName: String -> StateMediaObjectName
validateMediaObjectName value=
    if String.length value == 0 then
          StateStartMediaObjectName
      else if String.length value > 50 then
         StateTooLongMediaObjectName
      else
          StateAcceptableMediaObjectName
