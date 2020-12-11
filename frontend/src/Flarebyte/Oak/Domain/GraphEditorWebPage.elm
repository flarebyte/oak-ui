module Flarebyte.Oak.Domain.GraphEditorWebPage exposing (GraphEditorWebPage, GraphEditorWebPageState, reset, resetState)

import Flarebyte.Oak.Domain.Graph exposing(Graph)
import Flarebyte.Oak.Domain.StatisticalMetadata exposing(StatisticalMetadata)
import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Flarebyte.Oak.Domain.UnitCode exposing(UnitCode)
import Set exposing(Set)

type StateGraphEditorWebPageStatisticalMetadataList = 

  StateStartGraphEditorWebPageStatisticalMetadataList
  | StateAcceptableGraphEditorWebPageStatisticalMetadataList


type StateGraphEditorWebPageGraph = 

  StateStartGraphEditorWebPageGraph
  | StateAcceptableGraphEditorWebPageGraph


type StateGraphEditorWebPageWebPageState = 

  StateStartGraphEditorWebPageWebPageState
  | StateAcceptableGraphEditorWebPageWebPageState


type StateGraphEditorWebPageOptionalErrorMessage = 

  StateStartGraphEditorWebPageOptionalErrorMessage
  | StateAcceptableGraphEditorWebPageOptionalErrorMessage
  | StateTooLongGraphEditorWebPageOptionalErrorMessage


type StateGraphEditorWebPageTagSet = 

  StateStartGraphEditorWebPageTagSet
  | StateAcceptableGraphEditorWebPageTagSet


type StateGraphEditorWebPageUnitCodeList = 

  StateStartGraphEditorWebPageUnitCodeList
  | StateAcceptableGraphEditorWebPageUnitCodeList

type alias GraphEditorWebPage = 
  {
   statisticalMetadataList: List StatisticalMetadata
    ,graph: Graph
    ,webPageState: WebPageStateEnum
    ,optionalErrorMessage: String
    ,tagSet: Set Tag
    ,unitCodeList: List UnitCode
  }

type alias GraphEditorWebPageState = 
  {
   statisticalMetadataList: StateGraphEditorWebPageStatisticalMetadataList
    ,graph: StateGraphEditorWebPageGraph
    ,webPageState: StateGraphEditorWebPageWebPageState
    ,optionalErrorMessage: StateGraphEditorWebPageOptionalErrorMessage
    ,tagSet: StateGraphEditorWebPageTagSet
    ,unitCodeList: StateGraphEditorWebPageUnitCodeList
  }
reset: GraphEditorWebPage 
reset = 
  {
   statisticalMetadataList= []
    ,graph= Graph.reset
    ,webPageState= WebPageStateStartedAlt
    ,optionalErrorMessage= ""
    ,tagSet= Set.empty
    ,unitCodeList= []
  }

resetState: GraphEditorWebPageState 
resetState = 
  {
   statisticalMetadataList= StateStartGraphEditorWebPageStatisticalMetadataList
    ,graph= StateStartGraphEditorWebPageGraph
    ,webPageState= StateStartGraphEditorWebPageWebPageState
    ,optionalErrorMessage= StateStartGraphEditorWebPageOptionalErrorMessage
    ,tagSet= StateStartGraphEditorWebPageTagSet
    ,unitCodeList= StateStartGraphEditorWebPageUnitCodeList
  }
