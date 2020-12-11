module Flarebyte.Oak.Domain.StatisticalWebPage exposing (StatisticalWebPage, StatisticalWebPageState, reset, resetState)

import Flarebyte.Oak.Domain.StatisticalMetadata exposing(StatisticalMetadata)

type StateStatisticalWebPageStatisticalMetadataList = 

  StateStartStatisticalWebPageStatisticalMetadataList
  | StateAcceptableStatisticalWebPageStatisticalMetadataList

type alias StatisticalWebPage = 
  {
   statisticalMetadataList: List StatisticalMetadata
  }

type alias StatisticalWebPageState = 
  {
   statisticalMetadataList: StateStatisticalWebPageStatisticalMetadataList
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
