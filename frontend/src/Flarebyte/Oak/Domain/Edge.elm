module Flarebyte.Oak.Domain.Edge exposing (Edge)

import Flarebyte.Oak.Domain.Attribute exposing(Attribute)

type alias Edge = 
  {
   name: String
    , attributeList: List Attribute
    , fromNode: String
    , toNode: String
  }

