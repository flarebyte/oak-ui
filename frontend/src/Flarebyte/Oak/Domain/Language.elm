module Flarebyte.Oak.Domain.Language exposing (Language, LanguageState, LanguageAndState, reset, resetState, resetAndState)



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
    ,isAcceptable: Bool
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

resetAndState: LanguageAndState 
resetAndState = 
  {
   value= alpha
    ,state= beta
    ,isAcceptable= charlie
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


isStateAcceptable: LanguageState -> Bool
isStateAcceptable state=
  state.name == StateAcceptableLanguageName
    && state.description == StateAcceptableLanguageDescription


addValidation: LanguageAndState -> LanguageAndState
addValidation value=
  { value | state = validate value.value}
