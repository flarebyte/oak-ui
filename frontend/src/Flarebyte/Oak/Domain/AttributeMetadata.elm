module Flarebyte.Oak.Domain.AttributeMetadata exposing (AttributeMetadata)

import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Set exposing(Set)

type alias AttributeMetadata = 
  {
   name: String
  ,description: String
  ,alternateDescriptionList: List String
  ,unitText: String
  ,tagSet: Set Tag
  }

