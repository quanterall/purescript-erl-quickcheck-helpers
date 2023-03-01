module Test.QuickCheck.Helpers
  ( Properties(..)
  , property
  ) where

import Prelude

import Data.Either (Either(..))
import Data.Foldable (foldl)
import Effect (Effect)
import Effect.Class.Console as Console
import Effect.Exception as Exception
import Test.QuickCheck (Result(..), class Testable)
import Test.QuickCheck as QuickCheck

newtype Properties = Properties (Array Result)

instance Testable Properties where
  test (Properties results) = do
    pure $ foldl keepFailure Success results
    where
    keepFailure _oldResult (Failed reason) = Failed reason
    keepFailure oldResult _newResult = oldResult

property :: forall prop. Testable prop => String -> prop -> Effect Unit
property testName p = do
  seed <- QuickCheck.randomSeed
  result <- Exception.try $ QuickCheck.quickCheckWithSeed seed 100 p
  case result of
    Right _v -> pure unit
    Left message -> do
      Console.error $ "Property '" <> testName <> "' does not hold:"
      message # Exception.message # Console.error
      Exception.throwException message
