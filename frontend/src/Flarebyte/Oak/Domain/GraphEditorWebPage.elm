module Flarebyte.Oak.Domain.GraphEditorWebPage exposing (GraphEditorWebPage)

import Flarebyte.Oak.Domain.Graph exposing(Graph)
import Flarebyte.Oak.Domain.StatisticalMetadata exposing(StatisticalMetadata)
import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Flarebyte.Oak.Domain.UnitCode exposing(UnitCode)
import Set exposing(Set)

type alias GraphEditorWebPage = 
  {
   statisticalMetadataList: List StatisticalMetadata
    , graph: Graph
    , webPageState: Never
    , optionalErrorMessage: String
    , tagSet: Set Tag
    , unitCodeList: List UnitCode
  }

