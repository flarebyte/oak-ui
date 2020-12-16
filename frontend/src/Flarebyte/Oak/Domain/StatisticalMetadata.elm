module Flarebyte.Oak.Domain.StatisticalMetadata exposing (StatisticalMetadata, StatisticalMetadataState, StatisticalMetadataAndState, reset, resetState)

import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Set exposing(Set)

type StateStatisticalMetadataName = 

  StateStartStatisticalMetadataName
  | StateAcceptableStatisticalMetadataName
  | StateTooLongStatisticalMetadataName


type StateStatisticalMetadataValue = 

  StateStartStatisticalMetadataValue
  | StateAcceptableStatisticalMetadataValue
  | StateTooLongStatisticalMetadataValue


type StateStatisticalMetadataOptionalValueList = 

  StateStartStatisticalMetadataOptionalValueList
  | StateAcceptableStatisticalMetadataOptionalValueList
  | StateTooLongStatisticalMetadataOptionalValueList


type StateStatisticalMetadataTagSet = 

  StateStartStatisticalMetadataTagSet
  | StateAcceptableStatisticalMetadataTagSet

type alias StatisticalMetadata = 
  {
   name: String
    ,value: String
    ,optionalValueList: List String
    ,tagSet: Set Tag
  }

type alias StatisticalMetadataState = 
  {
   name: StateStatisticalMetadataName
    ,value: StateStatisticalMetadataValue
    ,optionalValueList: StateStatisticalMetadataOptionalValueList
    ,tagSet: StateStatisticalMetadataTagSet
  }

type alias StatisticalMetadataAndState = 
  {
   value: StatisticalMetadata
    ,state: StatisticalMetadataState
  }
reset: StatisticalMetadata 
reset = 
  {
   name= ""
    ,value= ""
    ,optionalValueList= []
    ,tagSet= Set.empty
  }

resetState: StatisticalMetadataState 
resetState = 
  {
   name= StateStartStatisticalMetadataName
    ,value= StateStartStatisticalMetadataValue
    ,optionalValueList= StateStartStatisticalMetadataOptionalValueList
    ,tagSet= StateStartStatisticalMetadataTagSet
  }
validateStatisticalMetadataName: String -> StateStatisticalMetadataName
validateStatisticalMetadataName value=
    if String.length value == 0 then
          StateStartStatisticalMetadataName
      else if String.length value > 50 then
         StateTooLongStatisticalMetadataName
      else
          StateAcceptableStatisticalMetadataName


validateStatisticalMetadataValue: String -> StateStatisticalMetadataValue
validateStatisticalMetadataValue value=
    if String.length value == 0 then
          StateStartStatisticalMetadataValue
      else if String.length value > 50 then
         StateTooLongStatisticalMetadataValue
      else
          StateAcceptableStatisticalMetadataValue


validateStatisticalMetadataOptionalValueList: List String -> StateStatisticalMetadataOptionalValueList
validateStatisticalMetadataOptionalValueList values=
    if List.isEmpty values then
          StateStartStatisticalMetadataOptionalValueList
      else if List.length values > 50 then
         StateTooLongStatisticalMetadataOptionalValueList
      else
          StateAcceptableStatisticalMetadataOptionalValueList


validate: StatisticalMetadata -> StatisticalMetadataState
validate value=
  {
  name = validateStatisticalMetadataName value.name
  , value = validateStatisticalMetadataValue value.value
  , optionalValueList = validateStatisticalMetadataOptionalValueList value.optionalValueList
  , tagSet = validateStatisticalMetadataTagSet value.tagSet
  }


addValidation: StatisticalMetadataAndState -> StatisticalMetadataAndState
addValidation value=
{ value | state = validate value.value}
