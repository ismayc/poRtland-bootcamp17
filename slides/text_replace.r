setwd("docs/slides")

file.copy(from = "slide_deck.Rmd", to = "slide_document_test.Rmd")

# system("sed -i 's/  xaringan::moon_reader:
#     lib_dir: libs
#   nature:
#   highlightStyle: github
#   highlightLines: true
#   highlightLanguage: r
#   countIncrementalSlides: false
#   css: example.css/html_document:
#       toc: true
#   toc_float: true
#   toc_depth: 1
#   theme: cosmo
#   highlight: tango
#   df_print: paged/g' slide_document_test.Rmd")

# output: 
#   html_document:
#     toc: true
#     toc_float: true
#     toc_depth: 1
#     theme: cosmo
#     highlight: tango
#     df_print: paged

system("sed -i 's/class/ugly/g' slide_document_test.Rmd")
