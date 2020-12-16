module Flarebyte.Oak.Domain.Attribute exposing (Attribute, AttributeState, AttributeAndState, reset, resetState)

import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Set exposing(Set)

type StateAttributeValue = 

  StateStartAttributeValue
  | StateAcceptableAttributeValue
  | StateTooLongAttributeValue


type StateAttributeOptionalValueList = 

  StateStartAttributeOptionalValueList
  | StateAcceptableAttributeOptionalValueList
  | StateTooLongAttributeOptionalValueList


type StateAttributeTagSet = 

  StateStartAttributeTagSet
  | StateAcceptableAttributeTagSet

type alias Attribute = 
  {
   value: String
    ,optionalValueList: List String
    ,tagSet: Set Tag
  }

type alias AttributeState = 
  {
   value: StateAttributeValue
    ,optionalValueList: StateAttributeOptionalValueList
    ,tagSet: StateAttributeTagSet
  }

type alias AttributeAndState = 
  {
   value: Attribute
    ,state: AttributeState
  }
reset: Attribute 
reset = 
  {
   value= ""
    ,optionalValueList= []
    ,tagSet= Set.empty
  }

resetState: AttributeState 
resetState = 
  {
   value= StateStartAttributeValue
    ,optionalValueList= StateStartAttributeOptionalValueList
    ,tagSet= StateStartAttributeTagSet
  }
validateAttributeValue: String -> StateAttributeValue
validateAttributeValue value=
    if String.length value == 0 then
          StateStartAttributeValue
      else if String.length value > 50 then
         StateTooLongAttributeValue
      else
          StateAcceptableAttributeValue


validateAttributeOptionalValueList: List String -> StateAttributeOptionalValueList
validateAttributeOptionalValueList values=
    if List.isEmpty values then
          StateStartAttributeOptionalValueList
      else if List.length values > 50 then
         StateTooLongAttributeOptionalValueList
      else
          StateAcceptableAttributeOptionalValueList


validate: Attribute -> AttributeState
validate value=
  {
  value = validateAttributeValue value.value
  , optionalValueList = validateAttributeOptionalValueList value.optionalValueList
  , tagSet = validateAttributeTagSet value.tagSet
  }


addValidation: AttributeAndState -> AttributeAndState
addValidation value=
{ value | state = validate value.value}
