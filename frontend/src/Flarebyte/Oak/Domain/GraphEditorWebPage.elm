module Flarebyte.Oak.Domain.GraphEditorWebPage exposing (GraphEditorWebPage, GraphEditorWebPageState, GraphEditorWebPageAndState, reset, resetState)

import Flarebyte.Oak.Domain.Graph exposing(Graph)
import Flarebyte.Oak.Domain.StatisticalMetadata exposing(StatisticalMetadata)
import Flarebyte.Oak.Domain.UnitCode exposing(UnitCode)
import Set as Set exposing(Set)

type StateGraphEditorWebPageStatisticalMetadataList = 

  StateStartGraphEditorWebPageStatisticalMetadataList
  | StateAcceptableGraphEditorWebPageStatisticalMetadataList
  | StateTooLongGraphEditorWebPageStatisticalMetadataList


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
  | StateTooLongGraphEditorWebPageTagSet


type StateGraphEditorWebPageUnitCodeList = 

  StateStartGraphEditorWebPageUnitCodeList
  | StateAcceptableGraphEditorWebPageUnitCodeList
  | StateTooLongGraphEditorWebPageUnitCodeList

type alias GraphEditorWebPage = 
  {
   statisticalMetadataList: List StatisticalMetadata
    ,graph: Graph
    ,webPageState: WebPageStateEnum
    ,optionalErrorMessage: String
    ,tagSet: Set String
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


validateGraphEditorWebPageTagSet: Set String -> StateGraphEditorWebPageTagSet
validateGraphEditorWebPageTagSet values=
    if Set.isEmpty values then
          StateStartGraphEditorWebPageTagSet
      else if Set.size values > 50 then
         StateTooLongGraphEditorWebPageTagSet
      else
          StateAcceptableGraphEditorWebPageTagSet


validateGraphEditorWebPageStatisticalMetadataList: List StatisticalMetadata -> StateGraphEditorWebPageStatisticalMetadataList
validateGraphEditorWebPageStatisticalMetadataList values=
    if List.isEmpty values then
          StateStartGraphEditorWebPageStatisticalMetadataList
      else if List.length values > 50 then
         StateTooLongGraphEditorWebPageStatisticalMetadataList
      else
          StateAcceptableGraphEditorWebPageStatisticalMetadataList


validateGraphEditorWebPageUnitCodeList: List UnitCode -> StateGraphEditorWebPageUnitCodeList
validateGraphEditorWebPageUnitCodeList values=
    if List.isEmpty values then
          StateStartGraphEditorWebPageUnitCodeList
      else if List.length values > 50 then
         StateTooLongGraphEditorWebPageUnitCodeList
      else
          StateAcceptableGraphEditorWebPageUnitCodeList


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


isStateAcceptable: GraphEditorWebPageState -> Bool
isStateAcceptable state=
  state.statisticalMetadataList == StateAcceptableGraphEditorWebPageStatisticalMetadataList
    && state.graph == StateAcceptableGraphEditorWebPageGraph
    && state.webPageState == StateAcceptableGraphEditorWebPageWebPageState
    && state.optionalErrorMessage == StateAcceptableGraphEditorWebPageOptionalErrorMessage
    && state.tagSet == StateAcceptableGraphEditorWebPageTagSet
    && state.unitCodeList == StateAcceptableGraphEditorWebPageUnitCodeList


addValidation: GraphEditorWebPageAndState -> GraphEditorWebPageAndState
addValidation value=
  { value | state = validate value.value}
