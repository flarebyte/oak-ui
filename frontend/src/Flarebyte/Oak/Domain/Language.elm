module Flarebyte.Oak.Domain.Language exposing (Language, LanguageState, LanguageAndState, reset, resetState)



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

type alias LanguageAndState = 
  {
   value: Language
    ,state: LanguageState
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
validateLanguageName: String -> StateLanguageName
validateLanguageName value=
    if String.length value == 0 then
          StateStartLanguageName
      else if String.length value > 50 then
         StateTooLongLanguageName
      else
          StateAcceptableLanguageName


validateLanguageDescription: String -> StateLanguageDescription
validateLanguageDescription value=
    if String.length value == 0 then
          StateStartLanguageDescription
      else if String.length value > 50 then
         StateTooLongLanguageDescription
      else
          StateAcceptableLanguageDescription


validate: Language -> LanguageState
validate value=
  {
  name = validateLanguageName value.name
  , description = validateLanguageDescription value.description
  }
