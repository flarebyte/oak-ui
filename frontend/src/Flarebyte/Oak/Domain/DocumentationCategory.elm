module Flarebyte.Oak.Domain.DocumentationCategory exposing (DocumentationCategory, DocumentationCategoryState, DocumentationCategoryAndState, reset, resetState)



type StateDocumentationCategoryName = 

  StateStartDocumentationCategoryName
  | StateAcceptableDocumentationCategoryName
  | StateTooLongDocumentationCategoryName


type StateDocumentationCategoryDescription = 

  StateStartDocumentationCategoryDescription
  | StateAcceptableDocumentationCategoryDescription
  | StateTooLongDocumentationCategoryDescription

type alias DocumentationCategory = 
  {
   name: String
    ,description: String
  }

type alias DocumentationCategoryState = 
  {
   name: StateDocumentationCategoryName
    ,description: StateDocumentationCategoryDescription
  }

type alias DocumentationCategoryAndState = 
  {
   value: DocumentationCategory
    ,state: DocumentationCategoryState
  }
reset: DocumentationCategory 
reset = 
  {
   name= ""
    ,description= ""
  }

resetState: DocumentationCategoryState 
resetState = 
  {
   name= StateStartDocumentationCategoryName
    ,description= StateStartDocumentationCategoryDescription
  }
validateDocumentationCategoryName: String -> StateDocumentationCategoryName
validateDocumentationCategoryName value=
    if String.length value == 0 then
          StateStartDocumentationCategoryName
      else if String.length value > 50 then
         StateTooLongDocumentationCategoryName
      else
          StateAcceptableDocumentationCategoryName


validateDocumentationCategoryDescription: String -> StateDocumentationCategoryDescription
validateDocumentationCategoryDescription value=
    if String.length value == 0 then
          StateStartDocumentationCategoryDescription
      else if String.length value > 50 then
         StateTooLongDocumentationCategoryDescription
      else
          StateAcceptableDocumentationCategoryDescription


validate: DocumentationCategory -> DocumentationCategoryState
validate value=
  {
  name = validateDocumentationCategoryName value.name
  , description = validateDocumentationCategoryDescription value.description
  }


addValidation: DocumentationCategoryAndState -> DocumentationCategoryAndState
addValidation value=
{ value | state = validate value.value}
