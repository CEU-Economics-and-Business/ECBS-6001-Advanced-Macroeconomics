%.presentation.pdf: %.txt
	echo "% presentation.tex" > input
	cat $< >> input
	wiki2pdf input
	mv input.pdf $@
	rm input input.tex
%.handout.pdf: %.txt
	echo "% handout.tex" > input
	cat $< >> input
	wiki2pdf input
	mv input.pdf $@
	rm input input.tex