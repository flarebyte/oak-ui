module Flarebyte.Oak.Domain.AttributeMetadata exposing (AttributeMetadata, AttributeMetadataState, AttributeMetadataAndState, reset, resetState)

import Flarebyte.Oak.Domain.Tag exposing(Tag)
import Set exposing(Set)

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

type alias AttributeMetadata = 
  {
   name: String
    ,description: String
    ,alternateDescriptionList: List String
    ,unitText: String
    ,tagSet: Set Tag
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


validateAttributeMetadataUnitText: String -> StateAttributeMetadataUnitText
validateAttributeMetadataUnitText value=
    if String.length value == 0 then
          StateStartAttributeMetadataUnitText
      else if String.length value > 50 then
         StateTooLongAttributeMetadataUnitText
      else
          StateAcceptableAttributeMetadataUnitText
