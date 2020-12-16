module Flarebyte.Oak.Domain.AttributeMetadata exposing (AttributeMetadata, AttributeMetadataState, AttributeMetadataAndState, reset, resetState)

import Set as Set exposing(Set)

type StateAttributeMetadataName = 

  StateStartAttributeMetadataName
  | StateAcceptableAttributeMetadataName
  | StateTooLongAttributeMetadataName


type StateAttributeMetadataDescription = 

  StateStartAttributeMetadataDescription
  | StateAcceptableAttributeMetadataDescription
  | StateTooLongAttributeMetadataDescription


type StateAttributeMetadataAlternateDescriptionList = 

  StateStartAttributeMetadataAlternateDescriptionList
  | StateAcceptableAttributeMetadataAlternateDescriptionList
  | StateTooLongAttributeMetadataAlternateDescriptionList


type StateAttributeMetadataUnitText = 

  StateStartAttributeMetadataUnitText
  | StateAcceptableAttributeMetadataUnitText
  | StateTooLongAttributeMetadataUnitText


type StateAttributeMetadataTagSet = 

  StateStartAttributeMetadataTagSet
  | StateAcceptableAttributeMetadataTagSet
  | StateTooLongAttributeMetadataTagSet

type alias AttributeMetadata = 
  {
   name: String
    ,description: String
    ,alternateDescriptionList: List String
    ,unitText: String
    ,tagSet: Set String
  }

type alias AttributeMetadataState = 
  {
   name: StateAttributeMetadataName
    ,description: StateAttributeMetadataDescription
    ,alternateDescriptionList: StateAttributeMetadataAlternateDescriptionList
    ,unitText: StateAttributeMetadataUnitText
    ,tagSet: StateAttributeMetadataTagSet
  }

type alias AttributeMetadataAndState = 
  {
   value: AttributeMetadata
    ,state: AttributeMetadataState
  }
reset: AttributeMetadata 
reset = 
  {
   name= ""
    ,description= ""
    ,alternateDescriptionList= []
    ,unitText= ""
    ,tagSet= Set.empty
  }

resetState: AttributeMetadataState 
resetState = 
  {
   name= StateStartAttributeMetadataName
    ,description= StateStartAttributeMetadataDescription
    ,alternateDescriptionList= StateStartAttributeMetadataAlternateDescriptionList
    ,unitText= StateStartAttributeMetadataUnitText
    ,tagSet= StateStartAttributeMetadataTagSet
  }
validateAttributeMetadataName: String -> StateAttributeMetadataName
validateAttributeMetadataName value=
    if String.length value == 0 then
          StateStartAttributeMetadataName
      else if String.length value > 50 then
         StateTooLongAttributeMetadataName
      else
          StateAcceptableAttributeMetadataName


validateAttributeMetadataDescription: String -> StateAttributeMetadataDescription
validateAttributeMetadataDescription value=
    if String.length value == 0 then
          StateStartAttributeMetadataDescription
      else if String.length value > 50 then
         StateTooLongAttributeMetadataDescription
      else
          StateAcceptableAttributeMetadataDescription


validateAttributeMetadataUnitText: String -> StateAttributeMetadataUnitText
validateAttributeMetadataUnitText value=
    if String.length value == 0 then
          StateStartAttributeMetadataUnitText
      else if String.length value > 50 then
         StateTooLongAttributeMetadataUnitText
      else
          StateAcceptableAttributeMetadataUnitText


validateAttributeMetadataAlternateDescriptionList: List String -> StateAttributeMetadataAlternateDescriptionList
validateAttributeMetadataAlternateDescriptionList values=
    if List.isEmpty values then
          StateStartAttributeMetadataAlternateDescriptionList
      else if List.length values > 50 then
         StateTooLongAttributeMetadataAlternateDescriptionList
      else
          StateAcceptableAttributeMetadataAlternateDescriptionList


validateAttributeMetadataTagSet: Set String -> StateAttributeMetadataTagSet
validateAttributeMetadataTagSet values=
    if Set.isEmpty values then
          StateStartAttributeMetadataTagSet
      else if Set.size values > 50 then
         StateTooLongAttributeMetadataTagSet
      else
          StateAcceptableAttributeMetadataTagSet


validate: AttributeMetadata -> AttributeMetadataState
validate value=
  {
  name = validateAttributeMetadataName value.name
  , description = validateAttributeMetadataDescription value.description
  , alternateDescriptionList = validateAttributeMetadataAlternateDescriptionList value.alternateDescriptionList
  , unitText = validateAttributeMetadataUnitText value.unitText
  , tagSet = validateAttributeMetadataTagSet value.tagSet
  }


isStateAcceptable: AttributeMetadataState -> Bool
isStateAcceptable state=
  state.name == StateAcceptableAttributeMetadataName
    && state.description == StateAcceptableAttributeMetadataDescription
    && (state.alternateDescriptionList == StateAcceptableAttributeMetadataAlternateDescriptionList || state.alternateDescriptionList == StateStartAttributeMetadataAlternateDescriptionList)
    && state.unitText == StateAcceptableAttributeMetadataUnitText
    && (state.tagSet == StateAcceptableAttributeMetadataTagSet || state.tagSet == StateStartAttributeMetadataTagSet)


addValidation: AttributeMetadataAndState -> AttributeMetadataAndState
addValidation value=
  { value | state = validate value.value}
