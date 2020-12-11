module Flarebyte.Oak.Domain.Node exposing (Node, NodeState, reset, resetState)

import Flarebyte.Oak.Domain.Attribute exposing(Attribute)

type StateNodeName = 

  StateStartNodeName
  | StateAcceptableNodeName
  | StateTooLongNodeName


type StateNodeAttributeList = 

  StateStartNodeAttributeList
  | StateAcceptableNodeAttributeList

type alias Node = 
  {
   name: String
    ,attributeList: List Attribute
  }

type alias NodeState = 
  {
   name: StateNodeName
    ,attributeList: StateNodeAttributeList
  }
reset: Node 
reset = 
  {
   name= ""
    ,attributeList= []
  }

resetState: NodeState 
resetState = 
  {
   name= StateStartNodeName
    ,attributeList= StateStartNodeAttributeList
  }
