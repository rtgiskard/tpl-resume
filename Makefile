#!/usr/bin/make -nf
# xetex

src ?= resume.tex
oft ?= pdf
src_misc := $(wildcard *.tex *.sty *.cls *.bib *.bst)
src_misc := $(subst ${src},,${src_misc})
out_dir := ./out
out := ${out_dir}/$(subst .tex,.${oft},${src})

sfx_quiet :=
sfx ?=

ifeq (${oft},pdf)
	VIEWER := $(shell which evince)
else
	VIEWER := $(shell which eog)
endif

${out}: ${src} ${src_misc}
	@ [ -d ${out_dir} ] || mkdir -p ${out_dir}
	@ latexmk -xelatex -silent -time -view=pdf -outdir=${out_dir} $<

view: ${out}
	@ ${VIEWER} ${out} >/dev/null 2>&1 &

quiet: override sfx_quiet := >/dev/null
quiet: ${out}

refresh:
	@ touch ${src} && make ${sfx}

clean:
	@ [ ! -d ${out_dir} ] || latexmk -c -outdir=${out_dir}

clobber:
	@ rm -rfv ${out_dir}


# vi: set ts=4 noexpandtab readonly :
