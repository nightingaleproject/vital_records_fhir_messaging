all : html pdf docx epub

DOCNAME = fhir_messaging_for_nvss
COMMON = document.md appendices.md Makefile out
SEQUENCE = submission.png retry.png retry2.png retry3.png error.png update.png void.png recode.png

.SUFFIXES : .seq .png

.seq.png :
	java -jar sequence/plantuml.jar -tpng $<

clean : 
	rm -r out

out : 
	mkdir -p out
	
epub : out/$(DOCNAME).epub

out/$(DOCNAME).epub : $(COMMON) $(SEQUENCE)
	pandoc -f markdown -t epub --number-sections -o out/$(DOCNAME).epub document.md appendices.md

html : out/$(DOCNAME).html

out/$(DOCNAME).html : $(COMMON) $(SEQUENCE)
	pandoc --self-contained -f markdown -t html --number-sections -o out/$(DOCNAME).html document.md appendices.md
 
docx : out/$(DOCNAME).docx

out/$(DOCNAME).docx : $(COMMON) Word/template.docx $(SEQUENCE)
	pandoc --self-contained -f markdown -t docx --reference-doc=Word/template.docx -o out/$(DOCNAME).docx document.md appendices.md
 
pdf : out/$(DOCNAME).pdf

out/$(DOCNAME).pdf : $(COMMON) LaTeX/pandoc_template.tex LaTeX/mitre.sty $(SEQUENCE)
	pandoc -f markdown -t latex -o out/appendices.tex --number-sections -V colorlinks=true appendices.md
	pandoc -s -f markdown -t latex -o out/$(DOCNAME).pdf --number-sections --toc -V colorlinks=true --template LaTeX/pandoc_template.tex --include-after-body out/appendices.tex document.md
