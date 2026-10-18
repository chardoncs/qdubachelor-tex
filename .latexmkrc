$pdf_mode = 1;
$pdflatex = "xelatex -shell-escape -synctex=1 -interaction=nonstopmode %O %S";
$biber = 'biber %O %S';
$max_repeat = 5;

$bibtex_use = 2;

# Clean up files
$clean_ext = "aux bbl bcf blg idx ind lof lot out toc synctex.gz run.xml";
