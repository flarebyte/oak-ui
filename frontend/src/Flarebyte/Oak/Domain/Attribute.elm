module Flarebyte.Oak.Domain.Attribute exposing (Attribute)

import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Set exposing(Set)

type alias Attribute = 
  {
   value: String
    , optionalValueList: List String
    , tagSet: Set Tag
  }

