" Humdrum YAML syntax overrides.
" Keep YAML structure readable without introducing syntax colors.

if get(g:, 'colors_name', '') !=# 'humdrum'
  finish
endif

if &background ==# 'light'
  let s:key = '#4d4a4a'
  let s:delimiter = '#777777'
  let s:marker = '#666666'
  let s:value = '#393636'
  let s:strong = '#2f2d2d'
else
  let s:key = '#cccccc'
  let s:delimiter = '#777777'
  let s:marker = '#999999'
  let s:value = '#d7d7d7'
  let s:strong = '#dddddd'
endif

execute 'highlight HumdrumYamlKey guifg=' . s:key . ' guibg=NONE gui=italic ctermfg=250 ctermbg=NONE cterm=italic'
execute 'highlight HumdrumYamlDelimiter guifg=' . s:delimiter . ' guibg=NONE gui=bold ctermfg=243 ctermbg=NONE cterm=bold'
execute 'highlight HumdrumYamlMarker guifg=' . s:marker . ' guibg=NONE gui=bold ctermfg=246 ctermbg=NONE cterm=bold'
execute 'highlight HumdrumYamlValue guifg=' . s:value . ' guibg=NONE gui=NONE ctermfg=253 ctermbg=NONE cterm=NONE'
execute 'highlight HumdrumYamlStrong guifg=' . s:strong . ' guibg=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold'
execute 'highlight HumdrumYamlConstant guifg=' . s:strong . ' guibg=NONE gui=italic ctermfg=254 ctermbg=NONE cterm=italic'
execute 'highlight HumdrumYamlReference guifg=' . s:value . ' guibg=NONE gui=bold,italic ctermfg=253 ctermbg=NONE cterm=bold,italic'
execute 'highlight HumdrumYamlEscape guifg=' . s:strong . ' guibg=NONE gui=bold ctermfg=254 ctermbg=NONE cterm=bold'
execute 'highlight HumdrumYamlError guifg=' . s:strong . ' guibg=NONE gui=bold,underline ctermfg=254 ctermbg=NONE cterm=bold,underline'

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
highlight! link yamlYAMLVersion HumdrumYamlStrong

highlight! link yamlTagHandle HumdrumYamlReference
highlight! link yamlTagPrefix HumdrumYamlReference
highlight! link yamlNodeTag HumdrumYamlReference
highlight! link yamlAnchor HumdrumYamlReference
highlight! link yamlAlias HumdrumYamlReference

highlight! link yamlString HumdrumYamlValue
highlight! link yamlFlowString HumdrumYamlValue
highlight! link yamlFlowStringDelimiter HumdrumYamlMarker
highlight! link yamlBlockString HumdrumYamlValue
highlight! link yamlPlainScalar HumdrumYamlValue
highlight! link yamlEscape HumdrumYamlEscape
highlight! link yamlSingleEscape HumdrumYamlEscape

highlight! link yamlMappingKey HumdrumYamlKey
highlight! link yamlFlowMappingKey HumdrumYamlKey
highlight! link yamlBlockMappingKey HumdrumYamlKey
highlight! link yamlMappingKeyStart HumdrumYamlMarker
highlight! link yamlFlowMappingKeyStart HumdrumYamlMarker
highlight! link yamlBlockMappingKeyStart HumdrumYamlMarker
highlight! link yamlMappingMerge HumdrumYamlDelimiter
highlight! link yamlFlowMappingMerge HumdrumYamlDelimiter
highlight! link yamlBlockMappingMerge HumdrumYamlDelimiter
highlight! link yamlKeyValueDelimiter HumdrumYamlDelimiter
highlight! link yamlFlowMappingDelimiter HumdrumYamlDelimiter
highlight! link yamlBlockMappingDelimiter HumdrumYamlDelimiter
highlight! link yamlFlowIndicator HumdrumYamlDelimiter
highlight! link yamlBlockCollectionItemStart HumdrumYamlMarker
highlight! link yamlBlockScalarHeader HumdrumYamlMarker

highlight! link yamlConstant HumdrumYamlConstant
highlight! link yamlNull HumdrumYamlConstant
highlight! link yamlBool HumdrumYamlConstant
highlight! link yamlInteger HumdrumYamlStrong
highlight! link yamlFloat HumdrumYamlStrong
highlight! link yamlTimestamp HumdrumYamlStrong

unlet s:key s:delimiter s:marker s:value s:strong
