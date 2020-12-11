module Flarebyte.Oak.Domain.DocumentationListWebPage exposing (DocumentationListWebPage, DocumentationListWebPageState, reset, resetState)

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

type alias DocumentationListWebPageState = 
  {
   publicDocumentationList: StateDocumentationListWebPagePublicDocumentationList
    ,documentationCategoryList: StateDocumentationListWebPageDocumentationCategoryList
  }
reset: DocumentationListWebPage 
reset = 
  {
   publicDocumentationList= []
    ,documentationCategoryList= []
  }

resetState: DocumentationListWebPageState 
resetState = 
  {
   publicDocumentationList= StateStartDocumentationListWebPagePublicDocumentationList
    ,documentationCategoryList= StateStartDocumentationListWebPageDocumentationCategoryList
  }
