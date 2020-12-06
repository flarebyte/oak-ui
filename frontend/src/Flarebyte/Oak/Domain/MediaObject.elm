module Flarebyte.Oak.Domain.MediaObject exposing (MediaObject)
type alias MediaObject = 
  {
   name: String
  ,description: String
  ,abstract: String
  ,protectedMediaObjectURL: String
  ,mediaObjectDataType: MediaObjectDataType
  ,robotCreatorName: String
}