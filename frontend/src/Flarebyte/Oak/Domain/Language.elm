module Flarebyte.Oak.Domain.Language exposing (Language, LanguageState, reset, resetState)



type StateLanguageName = 

  StateStartLanguageName
  | StateAcceptableLanguageName
  | StateTooLongLanguageName


type StateLanguageDescription = 

  StateStartLanguageDescription
  | StateAcceptableLanguageDescription
  | StateTooLongLanguageDescription

type alias Language = 
  {
   name: String
    ,description: String
  }

type alias LanguageState = 
  {
   name: StateLanguageName
    ,description: StateLanguageDescription
  }
reset: Language 
reset = 
  {
   name= ""
    ,description= ""
  }

resetState: LanguageState 
resetState = 
  {
   name= StateStartLanguageName
    ,description= StateStartLanguageDescription
  }
