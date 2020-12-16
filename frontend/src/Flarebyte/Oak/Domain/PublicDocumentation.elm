module Flarebyte.Oak.Domain.PublicDocumentation exposing (PublicDocumentation, PublicDocumentationState, PublicDocumentationAndState, reset, resetState)

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

type alias PublicDocumentationAndState = 
  {
   value: PublicDocumentation
    ,state: PublicDocumentationState
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
validatePublicDocumentationDescription: String -> StatePublicDocumentationDescription
validatePublicDocumentationDescription value=
    if String.length value == 0 then
          StateStartPublicDocumentationDescription
      else if String.length value > 50 then
         StateTooLongPublicDocumentationDescription
      else
          StateAcceptablePublicDocumentationDescription


validatePublicDocumentationPublicWebPage: String -> StatePublicDocumentationPublicWebPage
validatePublicDocumentationPublicWebPage value=
    if String.length value == 0 then
          StateStartPublicDocumentationPublicWebPage
      else if String.length value > 50 then
         StateTooLongPublicDocumentationPublicWebPage
      else
          StateAcceptablePublicDocumentationPublicWebPage


validate: PublicDocumentation -> PublicDocumentationState
validate value=
  {
  description = validatePublicDocumentationDescription value.description
  , publicWebPage = validatePublicDocumentationPublicWebPage value.publicWebPage
  , documentationCategory = validatePublicDocumentationDocumentationCategory value.documentationCategory
  }


isStateAcceptable: PublicDocumentationState -> Bool
isStateAcceptable state=
  state.description == StateAcceptablePublicDocumentationDescription
    && state.publicWebPage == StateAcceptablePublicDocumentationPublicWebPage
    && state.documentationCategory == StateAcceptablePublicDocumentationDocumentationCategory


addValidation: PublicDocumentationAndState -> PublicDocumentationAndState
addValidation value=
  { value | state = validate value.value}
