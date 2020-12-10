module Flarebyte.Oak.Domain.WebPageApplication exposing (WebPageApplication)

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

type alias WebPageApplication = 
  {
   graphEditorWebPage: GraphEditorWebPage
    , documentationListWebPage: DocumentationListWebPage
    , webPageState: Never
    , visualChoiceWebPage: VisualChoiceWebPage
    , languageList: List Language
    , language: Language
    , statisticalWebPage: StatisticalWebPage
    , workProgression: WorkProgression
    , tagSet: Set Tag
    , unitCodeList: List UnitCode
    , node: Node
  }

