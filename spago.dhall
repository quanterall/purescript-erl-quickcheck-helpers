{ name = "erl-sets"
, dependencies =
  [ "assert"
  , "console"
  , "effect"
  , "either"
  , "erl-test-eunit"
  , "exceptions"
  , "foldable-traversable"
  , "prelude"
  , "quickcheck"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, backend = "purerl"
}
