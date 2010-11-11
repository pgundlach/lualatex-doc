NAME   = lualatex-doc
DOC    = $(NAME).pdf
SRC    = $(NAME).tex
README = README
MKD    = $(README).markdown

ALLSRC = $(SRC) Makefile lltxdoc.cls
ALLGEN = $(DOC) $(README)
ALL    = $(ALLGEN) $(ALLSRC)
FORMAT = lualatex

all: lualatex-doc.pdf
world: all ctan

.PHONY: all world

%.pdf: %.tex
	# option -pdflatex will be available in the next release
	# of latexmk (4.19)
	latexmk -pdf -silent -pdflatex=lualatex $< >/dev/null

$(README): $(MKD)
	@cp $(MKD) $(README)

ctan: $(NAME).tds.zip -q
	@zip -q $(NAME).zip $(ALL) $(NAME).tds.zip

$(NAME).tds.zip -q: $(ALLGEN) $(ALLSRC)
	@rm -rf texmf
	@mkdir -p texmf/doc/$(FORMAT)/$(NAME)
	@cp $(ALLGEN) texmf/doc/$(FORMAT)/$(NAME)
	@mkdir -p texmf/source/$(FORMAT)/$(NAME)
	@cp $(ALLSRC) texmf/source/$(FORMAT)/$(NAME)
	@cd texmf && zip -q -r ../$(NAME).tds.zip .
	@rm -rf texmf

.PHONY: clean mrproper

clean:
	@latexmk -silent -c >/dev/null

mrproper: clean
	@rm -f -- $(ALLGEN) $(NAME)*.zip
