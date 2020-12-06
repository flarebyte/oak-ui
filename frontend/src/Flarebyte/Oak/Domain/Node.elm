module Flarebyte.Oak.Domain.Node exposing (Node)

import Flarebyte.Oak.Domain.AttributeList exposing(AttributeList)

type alias Node = 
  {
   name: String
  ,attributeList: List Attribute
  }

