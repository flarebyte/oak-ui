module Flarebyte.Oak.Domain.Graph exposing (Graph)

import Flarebyte.Oak.Domain.AttributeMetadata exposing(AttributeMetadata)
import Flarebyte.Oak.Domain.Edge exposing(Edge)
import Flarebyte.Oak.Domain.Node exposing(Node)

type alias Graph = 
  {
   nodeList: List Node
  ,edgeList: List Edge
  ,attributeMetadataList: List AttributeMetadata
  }

