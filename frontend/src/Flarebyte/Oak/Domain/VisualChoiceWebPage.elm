module Flarebyte.Oak.Domain.VisualChoiceWebPage exposing (VisualChoiceWebPage, VisualChoiceWebPageState, reset, resetState)

import Flarebyte.Oak.Domain.MediaObject exposing(MediaObject)
import Flarebyte.Oak.Domain.WorkProgression exposing(WorkProgression)

type StateVisualChoiceWebPageMediaObjectList = 

  StateStartVisualChoiceWebPageMediaObjectList
  | StateAcceptableVisualChoiceWebPageMediaObjectList


type StateVisualChoiceWebPageWebPageState = 

  StateStartVisualChoiceWebPageWebPageState
  | StateAcceptableVisualChoiceWebPageWebPageState


type StateVisualChoiceWebPageWorkProgression = 

  StateStartVisualChoiceWebPageWorkProgression
  | StateAcceptableVisualChoiceWebPageWorkProgression

type alias VisualChoiceWebPage = 
  {
   mediaObjectList: List MediaObject
    ,webPageState: WebPageStateEnum
    ,workProgression: WorkProgression
  }

type alias VisualChoiceWebPageState = 
  {
   mediaObjectList: StateVisualChoiceWebPageMediaObjectList
    ,webPageState: StateVisualChoiceWebPageWebPageState
    ,workProgression: StateVisualChoiceWebPageWorkProgression
  }
reset: VisualChoiceWebPage 
reset = 
  {
   mediaObjectList= []
    ,webPageState= WebPageStateStartedAlt
    ,workProgression= WorkProgression.reset
  }

resetState: VisualChoiceWebPageState 
resetState = 
  {
   mediaObjectList= StateStartVisualChoiceWebPageMediaObjectList
    ,webPageState= StateStartVisualChoiceWebPageWebPageState
    ,workProgression= StateStartVisualChoiceWebPageWorkProgression
  }
