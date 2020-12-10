module Flarebyte.Oak.Domain.PublicDocumentation exposing (PublicDocumentation)

import Flarebyte.Oak.Domain.DocumentationCategory exposing(DocumentationCategory)

type alias PublicDocumentation = 
  {
   description: String
    , publicWebPage: String
    , documentationCategory: DocumentationCategory
  }

