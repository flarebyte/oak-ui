module Flarebyte.Oak.Domain.VisualChoiceWebPage exposing (VisualChoiceWebPage)

import Flarebyte.Oak.Domain.MediaObject exposing(MediaObject)
import Flarebyte.Oak.Domain.WorkProgression exposing(WorkProgression)

type alias VisualChoiceWebPage = 
  {
   mediaObjectList: List MediaObject
    , webPageState: Never
    , workProgression: WorkProgression
  }

