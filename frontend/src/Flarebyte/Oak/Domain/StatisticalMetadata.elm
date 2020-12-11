module Flarebyte.Oak.Domain.StatisticalMetadata exposing (StatisticalMetadata, StatisticalMetadataState, reset, resetState)

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
