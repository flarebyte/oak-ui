module Flarebyte.Oak.Domain.StatisticalWebPage exposing (StatisticalWebPage)

import Flarebyte.Oak.Domain.StatisticalMetadata exposing(StatisticalMetadata)

type alias StatisticalWebPage = 
  {
   statisticalMetadataList: List StatisticalMetadata
  }

