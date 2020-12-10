module Flarebyte.Oak.Domain.Node exposing (Node)

import Flarebyte.Oak.Domain.Attribute exposing(Attribute)

type alias Node = 
  {
   name: String
    , attributeList: List Attribute
  }

