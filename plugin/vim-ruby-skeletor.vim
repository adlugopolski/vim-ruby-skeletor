function! CreateNewFileFromConstantInCurrentLine()
  ruby require_relative "ruby/app/parser/runner.rb"
  ruby Parser::Runner.call VimE("getline('.')")
endfunction

function! ExtractClassNameFromFile(filePath)
  ruby require_relative "ruby/app/extractor/runner.rb"
  ruby VimR Extractor.call VimE("a:filePath")
endfunction

if has("autocmd")
  augroup templates
    autocmd BufNewFile
      \ */app/services/*.rb
      \,*/app/services/**/*.rb
      \ 0r
      \ <sfile>:h/templates/service.rb

    autocmd BufNewFile
      \ */spec/services/*_spec.rb
      \,*/spec/services/**/*_spec.rb
      \ 0r
      \ <sfile>:h/templates/service_spec.rb
    
    autocmd BufNewFile
      \ */app/services/*.rb
      \,*/spec/services/*_spec.rb
      \,*/app/services/**/*.rb
      \,*/spec/services/**/*_spec.rb
      \ %substitute#\[:CLASSNAME:\]#
      \\=ExtractClassNameFromFile(expand("%:p"))#g
  augroup END
endif

nnoremap <Leader>nf :call CreateNewFileFromConstantInCurrentLine()<cr>
