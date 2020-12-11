module Flarebyte.Oak.Domain.WebPageApplication exposing (WebPageApplication, WebPageApplicationState, reset, resetState)

import Flarebyte.Oak.Domain.DocumentationListWebPage exposing(DocumentationListWebPage)
import Flarebyte.Oak.Domain.GraphEditorWebPage exposing(GraphEditorWebPage)
import Flarebyte.Oak.Domain.Language exposing(Language)
import Flarebyte.Oak.Domain.Node exposing(Node)
import Flarebyte.Oak.Domain.StatisticalWebPage exposing(StatisticalWebPage)
import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Flarebyte.Oak.Domain.UnitCode exposing(UnitCode)
import Flarebyte.Oak.Domain.VisualChoiceWebPage exposing(VisualChoiceWebPage)
import Flarebyte.Oak.Domain.WorkProgression exposing(WorkProgression)
import Set exposing(Set)

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


type StateWebPageApplicationUnitCodeList = 

  StateStartWebPageApplicationUnitCodeList
  | StateAcceptableWebPageApplicationUnitCodeList


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
    ,tagSet: Set Tag
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
