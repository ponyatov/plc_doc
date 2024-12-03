# var
MODULE ?= HorizonPLC

# dirs
CWD = $(CURDIR)
TMP = $(CWD)/tmp
DOC = $(CWD)/doc

# tool
LATEX = pdflatex -halt-on-error -interaction=batchmode -output-directory=$(TMP) -jobname=$(MODULE)

# src
TEX += tex/manual.tex $(wildcard tex/*.tex)

..PHONY: doc
doc: doc/$(MODULE).pdf

doc/$(MODULE).pdf: $(TEX)
	cd tex ; $(LATEX) $< && $(LATEX) $<

# install
.PHONY: install update doc ref
install: ref
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.$(shell lsb_release -si)`
ref:
