module Flarebyte.Oak.Domain.Graph exposing (Graph)

import Flarebyte.Oak.Domain.NodeList exposing(NodeList)
import Flarebyte.Oak.Domain.EdgeList exposing(EdgeList)
import Flarebyte.Oak.Domain.AttributeMetadataList exposing(AttributeMetadataList)

type alias Graph = 
  {
   nodeList: List Node
  ,edgeList: List Edge
  ,attributeMetadataList: List AttributeMetadata
  }

