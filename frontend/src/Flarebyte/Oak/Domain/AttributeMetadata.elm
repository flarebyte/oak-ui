module Flarebyte.Oak.Domain.AttributeMetadata exposing (AttributeMetadata)

import Flarebyte.Oak.Domain.TagSet exposing(TagSet)

type alias AttributeMetadata = 
  {
   name: String
  ,description: String
  ,alternateDescriptionList: List String
  ,unitText: String
  ,tagSet: Never
  }

