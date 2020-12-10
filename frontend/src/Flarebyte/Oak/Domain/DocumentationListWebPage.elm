module Flarebyte.Oak.Domain.DocumentationListWebPage exposing (DocumentationListWebPage)

import Flarebyte.Oak.Domain.DocumentationCategory exposing(DocumentationCategory)
import Flarebyte.Oak.Domain.PublicDocumentation exposing(PublicDocumentation)

type alias DocumentationListWebPage = 
  {
   publicDocumentationList: List PublicDocumentation
    , documentationCategoryList: List DocumentationCategory
  }

