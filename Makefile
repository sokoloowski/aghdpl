ifndef OUTPUT_FILE_SUFFIX
OUTPUT_FILE_SUFFIX := latest
endif

ifndef OUTPUT_PATH
OUTPUT_PATH := out
endif

pdf:
	pandoc -F pandoc-crossref src/*.md -o output.tex --top-level-division=chapter --template=template.latex --biblatex
	latexmk -pdf
	mkdir -p ${OUTPUT_PATH}
	mv output.pdf ${OUTPUT_PATH}/praca-dyplomowa-${OUTPUT_FILE_SUFFIX}.pdf
	latexmk -C
	rm output*
