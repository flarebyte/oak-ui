module Flarebyte.Oak.Domain.Graph exposing (Graph, GraphState, GraphAndState, reset, resetState)

import Flarebyte.Oak.Domain.AttributeMetadata exposing(AttributeMetadata)
import Flarebyte.Oak.Domain.Edge exposing(Edge)
import Flarebyte.Oak.Domain.Node exposing(Node)

type StateGraphNodeList = 

  StateStartGraphNodeList
  | StateAcceptableGraphNodeList


type StateGraphEdgeList = 

  StateStartGraphEdgeList
  | StateAcceptableGraphEdgeList


type StateGraphAttributeMetadataList = 

  StateStartGraphAttributeMetadataList
  | StateAcceptableGraphAttributeMetadataList

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
