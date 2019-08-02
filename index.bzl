# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

debug = False
override_repository_key = None
default_repository_key = "github"

def select_repository(name, repositories, key = default_repository_key):
  if(override_repository_key and key == default_repository_key):
    key = override_repository_key
  if(debug or key != default_repository_key):
    print('Selecting "' + key + '" for "' + name + '" repository.')
  rule = repositories[key]["rule"]
  kwargs = repositories[key]["kwargs"]
  rule(name=name, **kwargs)
