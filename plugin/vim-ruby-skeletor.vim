let s:require_path = expand("<sfile>:p:h") . "/../ruby/app/"

function! RubyRequireRelative(path)
  ruby require_relative Vim.evaluate("s:require_path . a:path")
endfunction

function! CreateNewFileFromConstantInCurrentLine()
  call RubyRequireRelative("parser/runner.rb")
  ruby Parser::Runner.call VimE("getline('.')")
endfunction

function! CreateNewRelativeFileFromConstantInCurrentLine()
  call RubyRequireRelative("parser/relative_runner.rb")
  ruby Parser::RelativeRunner.call VimE("getline('.')"), VimE("expand('%:p')")
endfunction

function! ExtractClassNameFromFile(filePath)
  call  RubyRequireRelative("extractor/runner.rb")
  ruby VimR Extractor.call VimE("a:filePath")
endfunction

if has("autocmd")
  augroup templates
    autocmd BufNewFile
      \ */app/services/*.rb
      \ 0r
      \ <sfile>:p:h/templates/service.rb

    autocmd BufNewFile
      \ */spec/services/*_spec.rb
      \ 0r
      \ <sfile>:p:h/templates/service_spec.rb

    autocmd BufNewFile
      \ */app/models/**/*_scope.rb
      \ 0r
      \ <sfile>:p:h/templates/model_scope.rb

    autocmd BufNewFile
      \ */app/controllers/**/*_facade.rb
      \,*/app/controllers/**/*_action.rb
      \ 0r
      \ <sfile>:p:h/templates/action.rb

    autocmd BufNewFile
      \ */spec/controllers/**/*_facade_spec.rb
      \,*/spec/controllers/**/*_action_spec.rb
      \ 0r
      \ <sfile>:p:h/templates/action_spec.rb

    autocmd BufNewFile
      \ */spec/models/**/*_scope_spec.rb
      \ 0r
      \ <sfile>:p:h/templates/model_scope_spec.rb

    autocmd BufNewFile
      \ */app/services/*.rb
      \,*/app/models/**/*_scope.rb
      \,*/app/controllers/**/*_facade.rb
      \,*/app/controllers/**/*_action.rb
      \,*/spec/services/*_spec.rb
      \,*/spec/models/**/*_scope_spec.rb
      \,*/spec/controllers/**/*_spec.rb
      \ %substitute#\[:CLASSNAME:\]#
      \\=ExtractClassNameFromFile(expand("%:p"))#g
  augroup END
endif

nnoremap <Leader>nf :call CreateNewFileFromConstantInCurrentLine()<cr>
nnoremap <Leader>nt :call CreateNewRelativeFileFromConstantInCurrentLine()<cr>
