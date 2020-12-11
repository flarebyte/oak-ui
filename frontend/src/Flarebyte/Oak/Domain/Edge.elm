module Flarebyte.Oak.Domain.Edge exposing (Edge, EdgeState, reset, resetState)

import Flarebyte.Oak.Domain.Attribute exposing(Attribute)

type StateEdgeName = 

  StateStartEdgeName
  | StateAcceptableEdgeName
  | StateTooLongEdgeName


type StateEdgeAttributeList = 

  StateStartEdgeAttributeList
  | StateAcceptableEdgeAttributeList


type StateEdgeFromNode = 

  StateStartEdgeFromNode
  | StateAcceptableEdgeFromNode
  | StateTooLongEdgeFromNode


type StateEdgeToNode = 

  StateStartEdgeToNode
  | StateAcceptableEdgeToNode
  | StateTooLongEdgeToNode

type alias Edge = 
  {
   name: String
    ,attributeList: List Attribute
    ,fromNode: String
    ,toNode: String
  }

type alias EdgeState = 
  {
   name: StateEdgeName
    ,attributeList: StateEdgeAttributeList
    ,fromNode: StateEdgeFromNode
    ,toNode: StateEdgeToNode
  }
reset: Edge 
reset = 
  {
   name= ""
    ,attributeList= []
    ,fromNode= ""
    ,toNode= ""
  }

resetState: EdgeState 
resetState = 
  {
   name= StateStartEdgeName
    ,attributeList= StateStartEdgeAttributeList
    ,fromNode= StateStartEdgeFromNode
    ,toNode= StateStartEdgeToNode
  }
