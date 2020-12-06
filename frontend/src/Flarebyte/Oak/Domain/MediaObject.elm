module Flarebyte.Oak.Domain.MediaObject exposing (MediaObject)

import Flarebyte.Oak.Domain.MediaObjectDataType exposing(MediaObjectDataType)

type alias MediaObject = 
  {
   name: String
  ,description: String
  ,abstract: String
  ,protectedMediaObjectURL: String
  ,mediaObjectDataType: MediaObjectDataType
  ,robotCreatorName: String
  }

