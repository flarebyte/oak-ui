module Flarebyte.Oak.Domain.Attribute exposing (Attribute)

import Flarebyte.Oak.Domain.TagSet exposing(TagSet)

type alias Attribute = 
  {
   value: String
  ,optionalValueList: List String
  ,tagSet: Never
  }

