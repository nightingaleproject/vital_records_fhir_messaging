all : html pdf docx epub

DOCNAME = fhir_messaging_for_nvss
COMMON = document.md appendices.md Makefile out
SEQUENCE = submission.png retry.png retry2.png retry3.png error.png update.png void.png recode.png
PANDOC = docker run --rm --volume "`pwd`:/pandoc" --user `id -u`:`id -g` dalibo/pandocker
TEMPLATE = --template LaTeX/pandoc_template.tex 
#PANDOC = pandoc

.SUFFIXES : .seq .png

.seq.png :
	java -jar sequence/plantuml.jar -tpng $<

clean : 
	rm -r out

out : 
	mkdir -p out
	
epub : out/$(DOCNAME).epub

out/$(DOCNAME).epub : $(COMMON) $(SEQUENCE)
	$(PANDOC) -f markdown -t epub --number-sections -o out/$(DOCNAME).epub document.md appendices.md

html : out/$(DOCNAME).html

out/$(DOCNAME).html : $(COMMON) $(SEQUENCE)
	$(PANDOC)  --self-contained -f markdown -t html --number-sections -o out/$(DOCNAME).html document.md appendices.md
 
docx : out/$(DOCNAME).docx

out/$(DOCNAME).docx : $(COMMON) Word/template.docx $(SEQUENCE)
	$(PANDOC)  --self-contained -f markdown -t docx --reference-doc=Word/template.docx -o out/$(DOCNAME).docx document.md appendices.md
 
pdf : out/$(DOCNAME).pdf

out/$(DOCNAME).pdf : $(COMMON) LaTeX/pandoc_template.tex LaTeX/mitre.sty $(SEQUENCE)
	$(PANDOC)  -f markdown -t latex -o out/appendices.tex --number-sections -V colorlinks=true appendices.md
	$(PANDOC)  -s -f markdown -t latex -o out/$(DOCNAME).pdf --number-sections --toc -V colorlinks=true $(TEMPLATE) --include-after-body out/appendices.tex document.md
