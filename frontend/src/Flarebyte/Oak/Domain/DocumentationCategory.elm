module Flarebyte.Oak.Domain.DocumentationCategory exposing (DocumentationCategory, DocumentationCategoryState, reset, resetState)



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
