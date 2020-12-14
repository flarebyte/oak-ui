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
