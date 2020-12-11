module Flarebyte.Oak.Domain.MediaObject exposing (MediaObject, MediaObjectState, reset, resetState)

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
