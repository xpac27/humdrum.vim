" Humdrum YAML syntax overrides.
" Keep YAML structure readable without introducing syntax colors.

if get(g:, 'colors_name', '') !=# 'humdrum'
  finish
endif

if &background ==# 'light'
  let s:key = '#2f2d2d'
  let s:delimiter = '#777777'
  let s:value = '#5f5958'
  let s:number = '#2f2d2d'
else
  let s:key = '#ffffff'
  let s:delimiter = '#777777'
  let s:value = '#cccccc'
  let s:number = '#ffffff'
endif

" Field names are the strongest structural element: bright, bold, and upright.
execute 'highlight HumdrumYamlKey guifg=' . s:key . ' guibg=NONE gui=bold ctermfg=255 ctermbg=NONE cterm=bold'

" Punctuation stays deliberately subdued. List dashes use this same group as
" flow delimiters ([ ], { }, commas) so they have identical visual weight.
execute 'highlight HumdrumYamlDelimiter guifg=' . s:delimiter . ' guibg=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE'

" Text/scalar values are secondary information: light gray and italic.
execute 'highlight HumdrumYamlValue guifg=' . s:value . ' guibg=NONE gui=italic ctermfg=250 ctermbg=NONE cterm=italic'

" Numeric values remain bright, but without extra typographic emphasis.
execute 'highlight HumdrumYamlNumber guifg=' . s:number . ' guibg=NONE gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE'
execute 'highlight HumdrumYamlConstant guifg=' . s:number . ' guibg=NONE gui=italic ctermfg=255 ctermbg=NONE cterm=italic'
execute 'highlight HumdrumYamlReference guifg=' . s:value . ' guibg=NONE gui=bold,italic ctermfg=250 ctermbg=NONE cterm=bold,italic'
execute 'highlight HumdrumYamlEscape guifg=' . s:number . ' guibg=NONE gui=bold ctermfg=255 ctermbg=NONE cterm=bold'
execute 'highlight HumdrumYamlError guifg=' . s:number . ' guibg=NONE gui=bold,underline ctermfg=255 ctermbg=NONE cterm=bold,underline'

" Exact neutral requested for visible special keys/indent guides. Highlight
" groups are global in Vim, so this remains in effect after a YAML buffer is
" opened; that is preferable to reintroducing a syntax color.
highlight SpecialKey guifg=#444444 guibg=NONE gui=bold ctermfg=238 ctermbg=NONE cterm=bold

highlight! link yamlComment Comment
highlight! link yamlTodo Todo

highlight! link yamlDocumentStart HumdrumYamlDelimiter
highlight! link yamlDocumentEnd HumdrumYamlDelimiter
highlight! link yamlDirectiveName HumdrumYamlKey
highlight! link yamlTAGDirective HumdrumYamlKey
highlight! link yamlYAMLDirective HumdrumYamlKey
highlight! link yamlReservedDirective HumdrumYamlError
highlight! link yamlYAMLVersion HumdrumYamlNumber

highlight! link yamlTagHandle HumdrumYamlReference
highlight! link yamlTagPrefix HumdrumYamlReference
highlight! link yamlNodeTag HumdrumYamlReference
highlight! link yamlAnchor HumdrumYamlReference
highlight! link yamlAlias HumdrumYamlReference

highlight! link yamlString HumdrumYamlValue
highlight! link yamlFlowString HumdrumYamlValue
highlight! link yamlFlowStringDelimiter HumdrumYamlDelimiter
highlight! link yamlBlockString HumdrumYamlValue
highlight! link yamlPlainScalar HumdrumYamlValue
highlight! link yamlEscape HumdrumYamlEscape
highlight! link yamlSingleEscape HumdrumYamlEscape

highlight! link yamlMappingKey HumdrumYamlKey
highlight! link yamlFlowMappingKey HumdrumYamlKey
highlight! link yamlBlockMappingKey HumdrumYamlKey
highlight! link yamlMappingKeyStart HumdrumYamlDelimiter
highlight! link yamlFlowMappingKeyStart HumdrumYamlDelimiter
highlight! link yamlBlockMappingKeyStart HumdrumYamlDelimiter
highlight! link yamlMappingMerge HumdrumYamlDelimiter
highlight! link yamlFlowMappingMerge HumdrumYamlDelimiter
highlight! link yamlBlockMappingMerge HumdrumYamlDelimiter
highlight! link yamlKeyValueDelimiter HumdrumYamlDelimiter
highlight! link yamlFlowMappingDelimiter HumdrumYamlDelimiter
highlight! link yamlBlockMappingDelimiter HumdrumYamlDelimiter
highlight! link yamlFlowIndicator HumdrumYamlDelimiter
highlight! link yamlBlockCollectionItemStart HumdrumYamlDelimiter
highlight! link yamlBlockScalarHeader HumdrumYamlDelimiter

highlight! link yamlConstant HumdrumYamlConstant
highlight! link yamlNull HumdrumYamlConstant
highlight! link yamlBool HumdrumYamlConstant
highlight! link yamlInteger HumdrumYamlNumber
highlight! link yamlFloat HumdrumYamlNumber
highlight! link yamlTimestamp HumdrumYamlNumber

unlet s:key s:delimiter s:value s:number
