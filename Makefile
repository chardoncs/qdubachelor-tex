#
# Makefile of QDUBachelor-TeX
#

REPO_NAME = qdubachelor-tex

MAIN_TEX = main
MAIN_BIB = main
OFFSET_COVER = offset-cover

REPO_URL = https://github.com/chardoncs/$(REPO_NAME).git

LATEXMK = latexmk

build:
	$(LATEXMK) $(MAIN_TEX).tex
	@cp $(MAIN_TEX).pdf $(shell cat $(MAIN_TEX).outname).pdf
	@echo 'Done'

clean: cleanpdf
	$(LATEXMK) -C
	@rm -f content/*.aux
	@echo 'Temporary files cleaned'

cleanpdf:
	@rm -f ./*.pdf
	@echo 'PDF cleaned'

viewpdf:
	@xdg-open *.pdf

build-preview: build viewpdf

offset-cover:
	$(LATEXMK) $(OFFSET_COVER).tex
	@echo 'Done'

upgrade: clean
	@rm -vrf ./$(REPO_NAME)
	@git clone $(REPO_URL)

	@mv -vf ./$(REPO_NAME)/qdubachelor.cls ./
	@mv -vf ./$(REPO_NAME)/qdubachelor-offset-cover.cls ./
	@mv -vf ./$(REPO_NAME)/qdu-logo.kra ./
	@cp -vrf ./$(REPO_NAME)/.github ./
	@cp -vrf ./$(REPO_NAME)/figures ./
	@mv -vf ./$(REPO_NAME)/README.md ./
	@mv -vf ./$(REPO_NAME)/LICENSE ./
	@mv -vf ./$(REPO_NAME)/Makefile ./

	@rm -vrf ./$(REPO_NAME)
	@echo 'All essential files upgraded'
