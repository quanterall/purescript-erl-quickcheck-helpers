{ name = "erl-sets"
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
