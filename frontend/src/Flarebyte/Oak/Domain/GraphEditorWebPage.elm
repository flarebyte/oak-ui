module Flarebyte.Oak.Domain.GraphEditorWebPage exposing (GraphEditorWebPage, GraphEditorWebPageState, GraphEditorWebPageAndState, reset, resetState)

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

type alias GraphEditorWebPageAndState = 
  {
   value: GraphEditorWebPage
    ,state: GraphEditorWebPageState
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
validateGraphEditorWebPageOptionalErrorMessage: String -> StateGraphEditorWebPageOptionalErrorMessage
validateGraphEditorWebPageOptionalErrorMessage value=
    if String.length value == 0 then
          StateStartGraphEditorWebPageOptionalErrorMessage
      else if String.length value > 50 then
         StateTooLongGraphEditorWebPageOptionalErrorMessage
      else
          StateAcceptableGraphEditorWebPageOptionalErrorMessage


validate: GraphEditorWebPage -> GraphEditorWebPageState
validate value=
  {
  statisticalMetadataList = validateGraphEditorWebPageStatisticalMetadataList value.statisticalMetadataList
  , graph = validateGraphEditorWebPageGraph value.graph
  , webPageState = validateGraphEditorWebPageWebPageState value.webPageState
  , optionalErrorMessage = validateGraphEditorWebPageOptionalErrorMessage value.optionalErrorMessage
  , tagSet = validateGraphEditorWebPageTagSet value.tagSet
  , unitCodeList = validateGraphEditorWebPageUnitCodeList value.unitCodeList
  }


addValidation: GraphEditorWebPageAndState -> GraphEditorWebPageAndState
addValidation value=
{ value | state = validate value.value}
