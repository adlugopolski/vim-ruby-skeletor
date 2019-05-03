let s:require_path = expand("<sfile>:p:h") . "/../ruby/app/"

function! RubyRequireRelative(path)
  ruby require_relative Vim.evaluate("s:require_path . a:path")
endfunction

function! CreateNewFileFromConstantInCurrentLine()
  call RubyRequireRelative("parser/runner.rb")
  ruby Parser::Runner.call VimE("getline('.')")
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
      \ */app/services/*.rb
      \,*/spec/services/*_spec.rb
      \ %substitute#\[:CLASSNAME:\]#
      \\=ExtractClassNameFromFile(expand("%:p"))#g
  augroup END
endif

nnoremap <Leader>nf :call CreateNewFileFromConstantInCurrentLine()<cr>
