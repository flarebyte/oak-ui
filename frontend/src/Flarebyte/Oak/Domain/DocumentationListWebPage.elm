module Flarebyte.Oak.Domain.DocumentationListWebPage exposing (DocumentationListWebPage, reset)

import Flarebyte.Oak.Domain.DocumentationCategory exposing(DocumentationCategory)
import Flarebyte.Oak.Domain.PublicDocumentation exposing(PublicDocumentation)

type StateDocumentationListWebPagePublicDocumentationList = 

  StateStartDocumentationListWebPagePublicDocumentationList
  | StateAcceptableDocumentationListWebPagePublicDocumentationList


type StateDocumentationListWebPageDocumentationCategoryList = 

  StateStartDocumentationListWebPageDocumentationCategoryList
  | StateAcceptableDocumentationListWebPageDocumentationCategoryList

type alias DocumentationListWebPage = 
  {
   publicDocumentationList: List PublicDocumentation
    ,documentationCategoryList: List DocumentationCategory
  }
reset: DocumentationListWebPage 
reset = 
  {
   publicDocumentationList= []
    ,documentationCategoryList= []
  }
