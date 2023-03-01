{ name = "erl-quickcheck-helpers"
, dependencies =
  [ "console"
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
