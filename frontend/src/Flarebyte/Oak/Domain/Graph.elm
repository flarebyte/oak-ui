module Flarebyte.Oak.Domain.Graph exposing (Graph)



type alias Graph = 
  {
   nodeList: List Node
  ,edgeList: List Edge
  ,attributeMetadataList: List AttributeMetadata
  }

