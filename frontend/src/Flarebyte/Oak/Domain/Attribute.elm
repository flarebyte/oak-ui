module Flarebyte.Oak.Domain.Attribute exposing (Attribute, AttributeState, reset, resetState)

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

toState: Attribute -> AttributeState
toState attribute =
  resetState
