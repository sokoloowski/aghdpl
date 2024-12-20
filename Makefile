ifndef OUTPUT_FILE_SUFFIX
OUTPUT_FILE_SUFFIX := latest
endif

ifndef OUTPUT_PATH
OUTPUT_PATH := out
endif

pdf:
	rm -f from-doi.bib
	pandoc --lua-filter diagram-generator.lua --lua-filter doi2cite.lua -F pandoc-crossref src/*.md -o output.tex --top-level-division=chapter --template=template.latex --biblatex
	latexmk -pdf
	mkdir -p ${OUTPUT_PATH}
	mv output.pdf ${OUTPUT_PATH}/praca-dyplomowa-${OUTPUT_FILE_SUFFIX}.pdf
	cp ${OUTPUT_PATH}/praca-dyplomowa-${OUTPUT_FILE_SUFFIX}.pdf ${OUTPUT_PATH}/praca-dyplomowa.pdf
	latexmk -C
	rm output*
