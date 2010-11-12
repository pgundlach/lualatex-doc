NAME   = lualatex-doc
FORMAT = lualatex

DOC    = $(NAME).pdf
SRC    = $(NAME).tex
README = README
MKD    = $(README).markdown

SRCFILES  = $(SRC) Makefile lltxdoc.cls
DOCFILES  = $(DOC) $(README) News
ALL       = $(SRCFILES) $(DOCFILES)

GENERATED = $(DOC) $(README)

all: lualatex-doc.pdf
world: all ctan

.PHONY: all world

# (with the next version of latexmk: -pdf -pdflatex=lualatex)
LATEXMK_FMT = -pdf -e '$$pdflatex = q(lualatex %O %S)'

%.pdf: %.tex
	latexmk -silent $(LATEXMK_FMT) $< >/dev/null

$(README): $(MKD)
	@cp $(MKD) $(README)

ctan: $(NAME).tds.zip
	@zip -q $(NAME).zip $(ALL) $(NAME).tds.zip

$(NAME).tds.zip -q: $(ALL)
	@rm -rf texmf
	@mkdir -p texmf/doc/$(FORMAT)/$(NAME)
	@cp $(DOCFILES) texmf/doc/$(FORMAT)/$(NAME)
	@mkdir -p texmf/source/$(FORMAT)/$(NAME)
	@cp $(SRCFILES) texmf/source/$(FORMAT)/$(NAME)
	@cd texmf && zip -q -r ../$(NAME).tds.zip .
	@rm -rf texmf

.PHONY: clean mrproper

clean:
	@latexmk -silent -c >/dev/null

mrproper: clean
	@rm -f -- $(GENERATED) $(NAME)*.zip
