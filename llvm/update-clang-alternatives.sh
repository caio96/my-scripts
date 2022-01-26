#!/bin/bash

version="12"
priority="10"

sudo update-alternatives \
    --install /usr/bin/clang                       clang                       /usr/bin/clang-${version} ${priority} \
    --slave   /usr/bin/asan_symbolize              asan_symbolize              /usr/bin/asan_symbolize-${version} \
    --slave   /usr/bin/clang++                     clang++                     /usr/bin/clang++-${version} \
    --slave   /usr/bin/clangd                      clangd                      /usr/bin/clangd-${version} \
    --slave   /usr/bin/clang-format                clang-format                /usr/bin/clang-format-${version} \
    --slave   /usr/bin/clang-format-diff           clang-format-diff           /usr/bin/clang-format-diff-${version} \
    --slave   /usr/bin/git-clang-format            git-clang-format            /usr/bin/git-clang-format-${version} \
    --slave   /usr/bin/clang-tidy                  clang-tidy                  /usr/bin/clang-tidy-${version} \
    --slave   /usr/bin/clang-tidy-diff             clang-tidy-diff             /usr/bin/clang-tidy-diff-${version}.py \
    --slave   /usr/bin/run-clang-tidy              run-clang-tidy              /usr/bin/run-clang-tidy-${version} \
    --slave   /usr/bin/c-index-test                c-index-test                /usr/bin/c-index-test-${version} \
    --slave   /usr/bin/clang-apply-replacements    clang-apply-replacements    /usr/bin/clang-apply-replacements-${version} \
    --slave   /usr/bin/clang-check                 clang-check                 /usr/bin/clang-check-${version} \
    --slave   /usr/bin/clang-query                 clang-query                 /usr/bin/clang-query-${version} \
    --slave   /usr/bin/sancov                      sancov                      /usr/bin/sancov-${version} \
    --slave   /usr/bin/scan-build                  scan-build                  /usr/bin/scan-build-${version} \
    --slave   /usr/bin/scan-view                   scan-view                   /usr/bin/scan-view-${version} \
    --slave   /usr/bin/ld.lld                      ld.lld                      /usr/bin/ld.lld-${version} \
    --slave   /usr/bin/lld                         lld                         /usr/bin/lld-${version}
