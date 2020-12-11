module Flarebyte.Oak.Domain.PublicDocumentation exposing (PublicDocumentation, PublicDocumentationState, reset, resetState)

import Flarebyte.Oak.Domain.DocumentationCategory exposing(DocumentationCategory)

type StatePublicDocumentationDescription = 

  StateStartPublicDocumentationDescription
  | StateAcceptablePublicDocumentationDescription
  | StateTooLongPublicDocumentationDescription


type StatePublicDocumentationPublicWebPage = 

  StateStartPublicDocumentationPublicWebPage
  | StateAcceptablePublicDocumentationPublicWebPage
  | StateTooLongPublicDocumentationPublicWebPage


type StatePublicDocumentationDocumentationCategory = 

  StateStartPublicDocumentationDocumentationCategory
  | StateAcceptablePublicDocumentationDocumentationCategory

type alias PublicDocumentation = 
  {
   description: String
    ,publicWebPage: String
    ,documentationCategory: DocumentationCategory
  }

type alias PublicDocumentationState = 
  {
   description: StatePublicDocumentationDescription
    ,publicWebPage: StatePublicDocumentationPublicWebPage
    ,documentationCategory: StatePublicDocumentationDocumentationCategory
  }
reset: PublicDocumentation 
reset = 
  {
   description= ""
    ,publicWebPage= ""
    ,documentationCategory= DocumentationCategory.reset
  }

resetState: PublicDocumentationState 
resetState = 
  {
   description= StateStartPublicDocumentationDescription
    ,publicWebPage= StateStartPublicDocumentationPublicWebPage
    ,documentationCategory= StateStartPublicDocumentationDocumentationCategory
  }
