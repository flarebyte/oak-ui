module Flarebyte.Oak.Domain.VisualChoiceWebPage exposing (VisualChoiceWebPage, VisualChoiceWebPageState, VisualChoiceWebPageAndState, reset, resetState)

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

type alias VisualChoiceWebPageAndState = 
  {
   value: VisualChoiceWebPage
    ,state: VisualChoiceWebPageState
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
validate: VisualChoiceWebPage -> VisualChoiceWebPageState
validate value=
  {
  mediaObjectList = validateVisualChoiceWebPageMediaObjectList value.mediaObjectList
  , webPageState = validateVisualChoiceWebPageWebPageState value.webPageState
  , workProgression = validateVisualChoiceWebPageWorkProgression value.workProgression
  }


addValidation: VisualChoiceWebPageAndState -> VisualChoiceWebPageAndState
addValidation value=
{ value | state = validate value.value}
