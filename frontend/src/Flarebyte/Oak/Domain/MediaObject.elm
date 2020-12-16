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


validateMediaObjectDescription: String -> StateMediaObjectDescription
validateMediaObjectDescription value=
    if String.length value == 0 then
          StateStartMediaObjectDescription
      else if String.length value > 50 then
         StateTooLongMediaObjectDescription
      else
          StateAcceptableMediaObjectDescription


validateMediaObjectAbstract: String -> StateMediaObjectAbstract
validateMediaObjectAbstract value=
    if String.length value == 0 then
          StateStartMediaObjectAbstract
      else if String.length value > 50 then
         StateTooLongMediaObjectAbstract
      else
          StateAcceptableMediaObjectAbstract


validateMediaObjectProtectedMediaObjectURL: String -> StateMediaObjectProtectedMediaObjectURL
validateMediaObjectProtectedMediaObjectURL value=
    if String.length value == 0 then
          StateStartMediaObjectProtectedMediaObjectURL
      else if String.length value > 50 then
         StateTooLongMediaObjectProtectedMediaObjectURL
      else
          StateAcceptableMediaObjectProtectedMediaObjectURL


validateMediaObjectRobotCreatorName: String -> StateMediaObjectRobotCreatorName
validateMediaObjectRobotCreatorName value=
    if String.length value == 0 then
          StateStartMediaObjectRobotCreatorName
      else if String.length value > 50 then
         StateTooLongMediaObjectRobotCreatorName
      else
          StateAcceptableMediaObjectRobotCreatorName


validate: MediaObject -> MediaObjectState
validate value=
  {
  name = validateMediaObjectName value.name
  , description = validateMediaObjectDescription value.description
  , abstract = validateMediaObjectAbstract value.abstract
  , protectedMediaObjectURL = validateMediaObjectProtectedMediaObjectURL value.protectedMediaObjectURL
  , mediaObjectDataType = validateMediaObjectMediaObjectDataType value.mediaObjectDataType
  , robotCreatorName = validateMediaObjectRobotCreatorName value.robotCreatorName
  }


addValidation: MediaObjectAndState -> MediaObjectAndState
addValidation value=
{ value | state = validate value.value}
