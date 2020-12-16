module Flarebyte.Oak.Domain.Node exposing (Node, NodeState, NodeAndState, reset, resetState)

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

type alias NodeAndState = 
  {
   value: Node
    ,state: NodeState
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
validateNodeName: String -> StateNodeName
validateNodeName value=
    if String.length value == 0 then
          StateStartNodeName
      else if String.length value > 50 then
         StateTooLongNodeName
      else
          StateAcceptableNodeName


validate: Node -> NodeState
validate value=
  {
  name = validateNodeName value.name
  , attributeList = validateNodeAttributeList value.attributeList
  }
