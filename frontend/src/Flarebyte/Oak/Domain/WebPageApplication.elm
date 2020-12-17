module Flarebyte.Oak.Domain.WebPageApplication exposing (WebPageApplication, WebPageApplicationState, WebPageApplicationAndState, reset, resetState, resetAndState)

import Flarebyte.Oak.Domain.DocumentationListWebPage exposing(DocumentationListWebPage)
import Flarebyte.Oak.Domain.GraphEditorWebPage exposing(GraphEditorWebPage)
import Flarebyte.Oak.Domain.Language exposing(Language)
import Flarebyte.Oak.Domain.Node exposing(Node)
import Flarebyte.Oak.Domain.StatisticalWebPage exposing(StatisticalWebPage)
import Flarebyte.Oak.Domain.UnitCode exposing(UnitCode)
import Flarebyte.Oak.Domain.VisualChoiceWebPage exposing(VisualChoiceWebPage)
import Flarebyte.Oak.Domain.WorkProgression exposing(WorkProgression)
import Set as Set exposing(Set)

type StateWebPageApplicationGraphEditorWebPage = 

  StateStartWebPageApplicationGraphEditorWebPage
  | StateAcceptableWebPageApplicationGraphEditorWebPage


type StateWebPageApplicationDocumentationListWebPage = 

  StateStartWebPageApplicationDocumentationListWebPage
  | StateAcceptableWebPageApplicationDocumentationListWebPage


type StateWebPageApplicationWebPageState = 

  StateStartWebPageApplicationWebPageState
  | StateAcceptableWebPageApplicationWebPageState


type StateWebPageApplicationVisualChoiceWebPage = 

  StateStartWebPageApplicationVisualChoiceWebPage
  | StateAcceptableWebPageApplicationVisualChoiceWebPage


type StateWebPageApplicationLanguageList = 

  StateStartWebPageApplicationLanguageList
  | StateAcceptableWebPageApplicationLanguageList
  | StateTooLongWebPageApplicationLanguageList


type StateWebPageApplicationLanguage = 

  StateStartWebPageApplicationLanguage
  | StateAcceptableWebPageApplicationLanguage


type StateWebPageApplicationStatisticalWebPage = 

  StateStartWebPageApplicationStatisticalWebPage
  | StateAcceptableWebPageApplicationStatisticalWebPage


type StateWebPageApplicationWorkProgression = 

  StateStartWebPageApplicationWorkProgression
  | StateAcceptableWebPageApplicationWorkProgression


type StateWebPageApplicationTagSet = 

  StateStartWebPageApplicationTagSet
  | StateAcceptableWebPageApplicationTagSet
  | StateTooLongWebPageApplicationTagSet


type StateWebPageApplicationUnitCodeList = 

  StateStartWebPageApplicationUnitCodeList
  | StateAcceptableWebPageApplicationUnitCodeList
  | StateTooLongWebPageApplicationUnitCodeList


type StateWebPageApplicationNode = 

  StateStartWebPageApplicationNode
  | StateAcceptableWebPageApplicationNode

type alias WebPageApplication = 
  {
   graphEditorWebPage: GraphEditorWebPage
    ,documentationListWebPage: DocumentationListWebPage
    ,webPageState: WebPageStateEnum
    ,visualChoiceWebPage: VisualChoiceWebPage
    ,languageList: List Language
    ,language: Language
    ,statisticalWebPage: StatisticalWebPage
    ,workProgression: WorkProgression
    ,tagSet: Set String
    ,unitCodeList: List UnitCode
    ,node: Node
  }

type alias WebPageApplicationState = 
  {
   graphEditorWebPage: StateWebPageApplicationGraphEditorWebPage
    ,documentationListWebPage: StateWebPageApplicationDocumentationListWebPage
    ,webPageState: StateWebPageApplicationWebPageState
    ,visualChoiceWebPage: StateWebPageApplicationVisualChoiceWebPage
    ,languageList: StateWebPageApplicationLanguageList
    ,language: StateWebPageApplicationLanguage
    ,statisticalWebPage: StateWebPageApplicationStatisticalWebPage
    ,workProgression: StateWebPageApplicationWorkProgression
    ,tagSet: StateWebPageApplicationTagSet
    ,unitCodeList: StateWebPageApplicationUnitCodeList
    ,node: StateWebPageApplicationNode
  }

type alias WebPageApplicationAndState = 
  {
   value: WebPageApplication
    ,state: WebPageApplicationState
    ,isAcceptable: Bool
  }
reset: WebPageApplication 
reset = 
  {
   graphEditorWebPage= GraphEditorWebPage.reset
    ,documentationListWebPage= DocumentationListWebPage.reset
    ,webPageState= WebPageStateStartedAlt
    ,visualChoiceWebPage= VisualChoiceWebPage.reset
    ,languageList= []
    ,language= Language.reset
    ,statisticalWebPage= StatisticalWebPage.reset
    ,workProgression= WorkProgression.reset
    ,tagSet= Set.empty
    ,unitCodeList= []
    ,node= Node.reset
  }

resetState: WebPageApplicationState 
resetState = 
  {
   graphEditorWebPage= StateStartWebPageApplicationGraphEditorWebPage
    ,documentationListWebPage= StateStartWebPageApplicationDocumentationListWebPage
    ,webPageState= StateStartWebPageApplicationWebPageState
    ,visualChoiceWebPage= StateStartWebPageApplicationVisualChoiceWebPage
    ,languageList= StateStartWebPageApplicationLanguageList
    ,language= StateStartWebPageApplicationLanguage
    ,statisticalWebPage= StateStartWebPageApplicationStatisticalWebPage
    ,workProgression= StateStartWebPageApplicationWorkProgression
    ,tagSet= StateStartWebPageApplicationTagSet
    ,unitCodeList= StateStartWebPageApplicationUnitCodeList
    ,node= StateStartWebPageApplicationNode
  }

resetAndState: WebPageApplicationAndState 
resetAndState = 
  {
   value= alpha
    ,state= beta
    ,isAcceptable= charlie
  }
validateWebPageApplicationTagSet: Set String -> StateWebPageApplicationTagSet
validateWebPageApplicationTagSet values=
    if Set.isEmpty values then
          StateStartWebPageApplicationTagSet
      else if Set.size values > 50 then
         StateTooLongWebPageApplicationTagSet
      else
          StateAcceptableWebPageApplicationTagSet


validateWebPageApplicationLanguageList: List Language -> StateWebPageApplicationLanguageList
validateWebPageApplicationLanguageList values=
    if List.isEmpty values then
          StateStartWebPageApplicationLanguageList
      else if List.length values > 50 then
         StateTooLongWebPageApplicationLanguageList
      else
          StateAcceptableWebPageApplicationLanguageList


validateWebPageApplicationUnitCodeList: List UnitCode -> StateWebPageApplicationUnitCodeList
validateWebPageApplicationUnitCodeList values=
    if List.isEmpty values then
          StateStartWebPageApplicationUnitCodeList
      else if List.length values > 50 then
         StateTooLongWebPageApplicationUnitCodeList
      else
          StateAcceptableWebPageApplicationUnitCodeList


validate: WebPageApplication -> WebPageApplicationState
validate value=
  {
  graphEditorWebPage = validateWebPageApplicationGraphEditorWebPage value.graphEditorWebPage
  , documentationListWebPage = validateWebPageApplicationDocumentationListWebPage value.documentationListWebPage
  , webPageState = validateWebPageApplicationWebPageState value.webPageState
  , visualChoiceWebPage = validateWebPageApplicationVisualChoiceWebPage value.visualChoiceWebPage
  , languageList = validateWebPageApplicationLanguageList value.languageList
  , language = validateWebPageApplicationLanguage value.language
  , statisticalWebPage = validateWebPageApplicationStatisticalWebPage value.statisticalWebPage
  , workProgression = validateWebPageApplicationWorkProgression value.workProgression
  , tagSet = validateWebPageApplicationTagSet value.tagSet
  , unitCodeList = validateWebPageApplicationUnitCodeList value.unitCodeList
  , node = validateWebPageApplicationNode value.node
  }


isStateAcceptable: WebPageApplicationState -> Bool
isStateAcceptable state=
  state.graphEditorWebPage == StateAcceptableWebPageApplicationGraphEditorWebPage
    && state.documentationListWebPage == StateAcceptableWebPageApplicationDocumentationListWebPage
    && state.webPageState == StateAcceptableWebPageApplicationWebPageState
    && state.visualChoiceWebPage == StateAcceptableWebPageApplicationVisualChoiceWebPage
    && (state.languageList == StateAcceptableWebPageApplicationLanguageList || state.languageList == StateStartWebPageApplicationLanguageList)
    && state.language == StateAcceptableWebPageApplicationLanguage
    && state.statisticalWebPage == StateAcceptableWebPageApplicationStatisticalWebPage
    && state.workProgression == StateAcceptableWebPageApplicationWorkProgression
    && (state.tagSet == StateAcceptableWebPageApplicationTagSet || state.tagSet == StateStartWebPageApplicationTagSet)
    && (state.unitCodeList == StateAcceptableWebPageApplicationUnitCodeList || state.unitCodeList == StateStartWebPageApplicationUnitCodeList)
    && state.node == StateAcceptableWebPageApplicationNode


addValidation: WebPageApplicationAndState -> WebPageApplicationAndState
addValidation value=
  { value | state = validate value.value}
