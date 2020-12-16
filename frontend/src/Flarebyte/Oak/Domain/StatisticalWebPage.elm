module Flarebyte.Oak.Domain.StatisticalWebPage exposing (StatisticalWebPage, StatisticalWebPageState, StatisticalWebPageAndState, reset, resetState)

import Flarebyte.Oak.Domain.StatisticalMetadata exposing(StatisticalMetadata)

type StateStatisticalWebPageStatisticalMetadataList = 

  StateStartStatisticalWebPageStatisticalMetadataList
  | StateAcceptableStatisticalWebPageStatisticalMetadataList
  | StateTooLongStatisticalWebPageStatisticalMetadataList

type alias StatisticalWebPage = 
  {
   statisticalMetadataList: List StatisticalMetadata
  }

type alias StatisticalWebPageState = 
  {
   statisticalMetadataList: StateStatisticalWebPageStatisticalMetadataList
  }

type alias StatisticalWebPageAndState = 
  {
   value: StatisticalWebPage
    ,state: StatisticalWebPageState
  }
reset: StatisticalWebPage 
reset = 
  {
   statisticalMetadataList= []
  }

resetState: StatisticalWebPageState 
resetState = 
  {
   statisticalMetadataList= StateStartStatisticalWebPageStatisticalMetadataList
  }
validate: StatisticalWebPage -> StatisticalWebPageState
validate value=
  {
  statisticalMetadataList = validateStatisticalWebPageStatisticalMetadataList value.statisticalMetadataList
  }


addValidation: StatisticalWebPageAndState -> StatisticalWebPageAndState
addValidation value=
  { value | state = validate value.value}
