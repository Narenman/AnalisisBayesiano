SRC=$(wildcard src/*.tex)
PDF=$(notdir $(patsubst %.tex,%.pdf,$(SRC)))

.PHONY:		all

all:		${PDF}

%.pdf:		src/%.tex
		latexmk -lualatex -silent -cd $<
		cp src/$@ .

clean:
		rm -f ${PDF}

veryclean:	clean
		rm -f $(addprefix src/,${PDF})
