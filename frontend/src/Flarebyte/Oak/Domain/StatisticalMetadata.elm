module Flarebyte.Oak.Domain.StatisticalMetadata exposing (StatisticalMetadata)

import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Set exposing(Set)

type alias StatisticalMetadata = 
  {
   name: String
    , value: String
    , optionalValueList: List String
    , tagSet: Set Tag
  }

