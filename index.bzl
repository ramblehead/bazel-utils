# Hey Emacs, this is -*- coding: utf-8; mode: bazel -*-

_debug = False

_override_repository_key = None

def _select_repository_default(name, repositories, default_key, key):
  # if(_override_repository_key and key == default_key):
  if(_override_repository_key):
    key = _override_repository_key
  # if(_debug or key != default_key):
  #   print("Selecting '" + key + "' for '" + name + "' repository.")
  print("Selecting '" + key + "' for '" + name + "' repository.")
  rule = repositories[key]["rule"]
  kwargs = repositories[key]["kwargs"]
  rule(name=name, **kwargs)

def select_repository_default(name, repositories, key = "default"):
  _select_repository_default(name, repositories, "default", key)

select_repository = select_repository_default

def select_repository_local(name, repositories, key = "local"):
  _select_repository_default(name, repositories, "local", key)
