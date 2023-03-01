module Test.Main
  ( main
  ) where

import Prelude

import Effect (Effect)
import Erl.Test.EUnit (suite, test)
import Erl.Test.EUnit as EUnit
import Test.QuickCheck ((===))
import Test.QuickCheck.Helpers (property)

main :: Effect Unit
main = do
  void $ EUnit.runTests do
    suite "basic interface" do
      test "`property`" do
        property "Addition is commutative" \(x :: Int) (y :: Int) ->
          x + y === y + x
