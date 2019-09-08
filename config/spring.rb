# frozen_string_literal: true

%w[
  .tool-versions
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
].each { |path| Spring.watch(path) }
