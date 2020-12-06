module Flarebyte.Oak.Domain.Edge exposing (Edge)

import Flarebyte.Oak.Domain.AttributeList exposing(AttributeList)

type alias Edge = 
  {
   name: String
  ,attributeList: List Attribute
  ,fromNode: String
  ,toNode: String
  }

