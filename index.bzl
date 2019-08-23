# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

_debug = False

_override_repository_key = None

def select_repository(name, repositories, key):
  if(_override_repository_key):
    key = _override_repository_key
  print("Selecting '" + key + "' for '" + name + "' repository.")
  rule = repositories[key]["rule"]
  kwargs = repositories[key]["kwargs"]
  rule(name=name, **kwargs)

def select_repository_remote(name, repositories, key = "remote"):
  select_repository(name, repositories, key)

def select_repository_local(name, repositories, key = "local"):
  select_repository(name, repositories, key)
