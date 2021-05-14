# Markdown-based Project Deliverables

This project is a template that can be used to create MITRE project deliverables using Markdown.

## Prerequisites

1. LaTeX
2. pandoc

### MacOS Installation

- [MacTeX](https://tug.org/mactex/mactex-download.html)
- [pandoc](http://pandoc.org/installing.html#macos)

### Windows Installation

- [MiKTeX](https://miktex.org/howto/install-miktex)
- [pandoc](http://pandoc.org/installing.html#windows)

### Linux Installation

- [TeX Live](https://www.tug.org/texlive/)
- [pandoc](http://pandoc.org/installing.html#linux)

## Creating Your Deliverable

1. Clone this repository
1. Edit the line that read `DOCNAME = deliverable_name` in `Makefile` to set the name of your deliverable 
1. Edit `document.md` and `appendices.md` to enter your content
1. Run `make` in the root of this repository
1. Output is in the `out` directory

This template uses [`pandoc` flavored Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown).
