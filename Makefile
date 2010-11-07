NAME   = lualatex-doc
DOC    = $(NAME).pdf
SRC    = $(NAME).tex
README = README
MKD    = $(README).markdown

ALLSRC = $(SRC) Makefile
ALLGEN = $(DOC) $(README)
ALL    = $(ALLGEN) $(ALLSRC)
FORMAT = lualatex

all: lualatex-doc.pdf
world: all ctan

.PHONY: all world

%.pdf: %.tex
	latexmk -silent -pdflatex=lualatex $< >/dev/null

$(README): $(MKD)
	@cp $(MKD) $(README)

ctan: $(NAME).tds.zip -q
	@zip -q $(NAME).zip $(ALL) $(NAME).tds.zip

$(NAME).tds.zip -q: $(ALLGEN) $(ALLSRC)
	@rm -rf texmf
	@mkdir -p texmf/doc/$(FORMAT)
	@cp $(ALLGEN) texmf/doc/$(FORMAT)
	@mkdir -p texmf/source/$(FORMAT)
	@cp $(ALLSRC) texmf/source/$(FORMAT)
	@cd texmf && zip -q -r ../$(NAME).tds.zip .
	@rm -rf texmf

.PHONY: clean mrproper

clean:
	@latexmk -silent -c >/dev/null

mrproper: clean
	@rm -f -- $(ALLGEN) $(NAME)*.zip
