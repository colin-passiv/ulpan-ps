module Ulpan.Model.Configuration where

import Prelude

import Foreign.Class (class Encode, class Decode)
import Foreign.Generic (defaultOptions, genericDecode, genericEncode)
import Data.Enum (class Enum)
import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Bounded (genericBottom, genericTop)
import Data.Generic.Rep.Enum (genericSucc, genericPred)
import Data.Generic.Rep.Show (genericShow)
import Data.Newtype (class Newtype)
import Test.QuickCheck.Arbitrary (class Arbitrary, genericArbitrary)


-- TestOrdering

data TestOrdering = FileOrdered | Shuffled | Random

derive instance eqTestOrdering ∷ Eq TestOrdering

derive instance ordTestOrdering ∷ Ord TestOrdering

derive instance genericTestOrdering ∷ Generic TestOrdering _

instance boundedTestOrdering ∷ Bounded TestOrdering where
  top    = genericTop
  bottom = genericBottom

instance enumTestOrdering ∷ Enum TestOrdering where
  succ = genericSucc
  pred = genericPred

instance showTestOrdering ∷ Show TestOrdering where
  show = genericShow

instance genericDecodeTestOrdering ∷ Decode TestOrdering where
  decode = genericDecode defaultOptions

instance genericEncodeTestOrdering ∷ Encode TestOrdering where
  encode = genericEncode defaultOptions

instance arbitraryTestOrdering ∷ Arbitrary TestOrdering where
  arbitrary = genericArbitrary



-- Test Direction

data TestDirection = FromLanguage1 | FromLanguage2 | DShuffled

derive instance eqTestDirection ∷ Eq TestDirection

derive instance ordTestDirection ∷ Ord TestDirection

derive instance genericTestDirection ∷ Generic TestDirection _

instance boundedTestDirection ∷ Bounded TestDirection where
  top    = genericTop
  bottom = genericBottom

instance enumTestDirection ∷ Enum TestDirection where
  succ = genericSucc
  pred = genericPred

instance showTestDirection ∷ Show TestDirection where
  show = genericShow

instance genericDecodeTestDirection ∷ Decode TestDirection where
  decode = genericDecode defaultOptions

instance genericEncodeTestDirection ∷ Encode TestDirection where
  encode = genericEncode defaultOptions

instance arbitraryTestDirection ∷ Arbitrary TestDirection where
  arbitrary = genericArbitrary


-- Configuration

newtype Configuration = Configuration
  { testOrdering  ∷ TestOrdering
  , testDirection ∷ TestDirection
  , showNotes     ∷ Boolean
  }

derive instance eqConfiguration ∷ Eq Configuration

derive instance newtypeConfiguration ∷ Newtype Configuration _

derive instance genericConfiguration ∷ Generic Configuration _

instance showConfiguration ∷ Show Configuration where
  show = genericShow

instance arbitraryConfiguration ∷ Arbitrary Configuration where
  arbitrary = genericArbitrary
