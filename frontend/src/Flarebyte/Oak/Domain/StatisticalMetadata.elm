module Flarebyte.Oak.Domain.StatisticalMetadata exposing (StatisticalMetadata, StatisticalMetadataState, StatisticalMetadataAndState, reset, resetState, resetAndState)

import Set as Set exposing(Set)

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
  | StateTooLongStatisticalMetadataTagSet

type alias StatisticalMetadata = 
  {
   name: String
    ,value: String
    ,optionalValueList: List String
    ,tagSet: Set String
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
    ,isAcceptable: Bool
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

resetAndState: StatisticalMetadataAndState 
resetAndState = 
  {
   value= alpha
    ,state= beta
    ,isAcceptable= charlie
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


validateStatisticalMetadataTagSet: Set String -> StateStatisticalMetadataTagSet
validateStatisticalMetadataTagSet values=
    if Set.isEmpty values then
          StateStartStatisticalMetadataTagSet
      else if Set.size values > 50 then
         StateTooLongStatisticalMetadataTagSet
      else
          StateAcceptableStatisticalMetadataTagSet


validate: StatisticalMetadata -> StatisticalMetadataState
validate value=
  {
  name = validateStatisticalMetadataName value.name
  , value = validateStatisticalMetadataValue value.value
  , optionalValueList = validateStatisticalMetadataOptionalValueList value.optionalValueList
  , tagSet = validateStatisticalMetadataTagSet value.tagSet
  }


isStateAcceptable: StatisticalMetadataState -> Bool
isStateAcceptable state=
  state.name == StateAcceptableStatisticalMetadataName
    && state.value == StateAcceptableStatisticalMetadataValue
    && (state.optionalValueList == StateAcceptableStatisticalMetadataOptionalValueList || state.optionalValueList == StateStartStatisticalMetadataOptionalValueList)
    && (state.tagSet == StateAcceptableStatisticalMetadataTagSet || state.tagSet == StateStartStatisticalMetadataTagSet)


addValidation: StatisticalMetadataAndState -> StatisticalMetadataAndState
addValidation value=
  { value | state = validate value.value}
