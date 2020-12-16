module Flarebyte.Oak.Domain.Graph exposing (Graph, GraphState, GraphAndState, reset, resetState)

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
validate: Graph -> GraphState
validate value=
  {
  nodeList = validateGraphNodeList value.nodeList
  , edgeList = validateGraphEdgeList value.edgeList
  , attributeMetadataList = validateGraphAttributeMetadataList value.attributeMetadataList
  }


addValidation: GraphAndState -> GraphAndState
addValidation value=
  { value | state = validate value.value}
