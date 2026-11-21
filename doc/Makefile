# SAMx8
# (C) 2023-2025 Ciaran Anscomb
# CC BY-SA 4.0

# Generate manual from LaTeX source

.PHONY: all
all: samx8.pdf

.PHONY: ps
ps: samx8.ps

####

CLEAN =

####

%.png: %.dt
	drawtiming --cell-width 16 --output $@ $<

####

TEXFILES = samx8.tex

LOGFILES = $(TEXFILES:.tex=.log)
AUXFILES = $(TEXFILES:.tex=.aux)
PDFFILES = $(TEXFILES:.tex=.pdf)
PSFILES = $(TEXFILES:.tex=.ps)
OUTFILES = $(TEXFILES:.tex=.out)

CLEAN += $(LOGFILES) $(AUXFILES) $(PDFFILES) $(PSFILES) $(OUTFILES)

samx8.pdf: samx8-slow-timing.png samx8-fast-timing.png

CLEAN += samx8-slow-timing.png samx8-fast-timing.png

####

%.pdf: %.tex
	pdflatex -draftmode $<
	pdflatex $<

%.ps: %.pdf
	pdftops -paper A4 -duplex $<

####

.PHONY: clean
clean:
	rm -f $(CLEAN)
