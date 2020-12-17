module Flarebyte.Oak.Domain.Graph exposing (Graph, GraphState, GraphAndState, reset, resetState, resetAndState)

import Flarebyte.Oak.Domain.AttributeMetadata exposing(AttributeMetadata)
import Flarebyte.Oak.Domain.Edge exposing(Edge)
import Flarebyte.Oak.Domain.Node exposing(Node)

type StateGraphNodeList = 

  StateStartGraphNodeList
  | StateAcceptableGraphNodeList
  | StateTooLongGraphNodeList


type StateGraphEdgeList = 

  StateStartGraphEdgeList
  | StateAcceptableGraphEdgeList
  | StateTooLongGraphEdgeList


type StateGraphAttributeMetadataList = 

  StateStartGraphAttributeMetadataList
  | StateAcceptableGraphAttributeMetadataList
  | StateTooLongGraphAttributeMetadataList

type alias Graph = 
  {
   nodeList: List Node
    ,edgeList: List Edge
    ,attributeMetadataList: List AttributeMetadata
  }

type alias GraphState = 
  {
   nodeList: StateGraphNodeList
    ,edgeList: StateGraphEdgeList
    ,attributeMetadataList: StateGraphAttributeMetadataList
  }

type alias GraphAndState = 
  {
   value: Graph
    ,state: GraphState
    ,isAcceptable: Bool
  }
reset: Graph 
reset = 
  {
   nodeList= []
    ,edgeList= []
    ,attributeMetadataList= []
  }

resetState: GraphState 
resetState = 
  {
   nodeList= StateStartGraphNodeList
    ,edgeList= StateStartGraphEdgeList
    ,attributeMetadataList= StateStartGraphAttributeMetadataList
  }

resetAndState: GraphAndState 
resetAndState = 
  {
   value= alpha
    ,state= beta
    ,isAcceptable= charlie
  }
validateGraphNodeList: List Node -> StateGraphNodeList
validateGraphNodeList values=
    if List.isEmpty values then
          StateStartGraphNodeList
      else if List.length values > 50 then
         StateTooLongGraphNodeList
      else
          StateAcceptableGraphNodeList


validateGraphEdgeList: List Edge -> StateGraphEdgeList
validateGraphEdgeList values=
    if List.isEmpty values then
          StateStartGraphEdgeList
      else if List.length values > 50 then
         StateTooLongGraphEdgeList
      else
          StateAcceptableGraphEdgeList


validateGraphAttributeMetadataList: List AttributeMetadata -> StateGraphAttributeMetadataList
validateGraphAttributeMetadataList values=
    if List.isEmpty values then
          StateStartGraphAttributeMetadataList
      else if List.length values > 50 then
         StateTooLongGraphAttributeMetadataList
      else
          StateAcceptableGraphAttributeMetadataList


validate: Graph -> GraphState
validate value=
  {
  nodeList = validateGraphNodeList value.nodeList
  , edgeList = validateGraphEdgeList value.edgeList
  , attributeMetadataList = validateGraphAttributeMetadataList value.attributeMetadataList
  }


isStateAcceptable: GraphState -> Bool
isStateAcceptable state=
  (state.nodeList == StateAcceptableGraphNodeList || state.nodeList == StateStartGraphNodeList)
    && (state.edgeList == StateAcceptableGraphEdgeList || state.edgeList == StateStartGraphEdgeList)
    && (state.attributeMetadataList == StateAcceptableGraphAttributeMetadataList || state.attributeMetadataList == StateStartGraphAttributeMetadataList)


addValidation: GraphAndState -> GraphAndState
addValidation value=
  { value | state = validate value.value}
