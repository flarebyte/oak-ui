module Flarebyte.Oak.Domain.Edge exposing (Edge, EdgeState, EdgeAndState, reset, resetState)

import Flarebyte.Oak.Domain.Attribute exposing(Attribute)

type StateEdgeName = 

  StateStartEdgeName
  | StateAcceptableEdgeName
  | StateTooLongEdgeName


type StateEdgeAttributeList = 

  StateStartEdgeAttributeList
  | StateAcceptableEdgeAttributeList
  | StateTooLongEdgeAttributeList


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

type alias EdgeAndState = 
  {
   value: Edge
    ,state: EdgeState
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
validateEdgeName: String -> StateEdgeName
validateEdgeName value=
    if String.length value == 0 then
          StateStartEdgeName
      else if String.length value > 50 then
         StateTooLongEdgeName
      else
          StateAcceptableEdgeName


validateEdgeFromNode: String -> StateEdgeFromNode
validateEdgeFromNode value=
    if String.length value == 0 then
          StateStartEdgeFromNode
      else if String.length value > 50 then
         StateTooLongEdgeFromNode
      else
          StateAcceptableEdgeFromNode


validateEdgeToNode: String -> StateEdgeToNode
validateEdgeToNode value=
    if String.length value == 0 then
          StateStartEdgeToNode
      else if String.length value > 50 then
         StateTooLongEdgeToNode
      else
          StateAcceptableEdgeToNode


validateEdgeAttributeList: List Attribute -> StateEdgeAttributeList
validateEdgeAttributeList values=
    if List.isEmpty values then
          StateStartEdgeAttributeList
      else if List.length values > 50 then
         StateTooLongEdgeAttributeList
      else
          StateAcceptableEdgeAttributeList


validate: Edge -> EdgeState
validate value=
  {
  name = validateEdgeName value.name
  , attributeList = validateEdgeAttributeList value.attributeList
  , fromNode = validateEdgeFromNode value.fromNode
  , toNode = validateEdgeToNode value.toNode
  }


isStateAcceptable: EdgeState -> Bool
isStateAcceptable state=
  state.name == StateAcceptableEdgeName
    && (state.attributeList == StateAcceptableEdgeAttributeList || state.attributeList == StateStartEdgeAttributeList)
    && state.fromNode == StateAcceptableEdgeFromNode
    && state.toNode == StateAcceptableEdgeToNode


addValidation: EdgeAndState -> EdgeAndState
addValidation value=
  { value | state = validate value.value}
