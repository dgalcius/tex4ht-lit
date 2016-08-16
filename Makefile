# $Id: Makefile 189 2016-07-18 23:23:50Z karl $
# This file is public domain.  Originally written 2010, Karl Berry.
# 
# todo: look for xx below

SHELL = /bin/sh

wd = work.dir
htmldir=html.dir
xtpipesdir=xtpipes.dir
deriveddir=derived.dir
tex_opts = --interaction=errorstopmode -recorder #--file-line-error
#tex_opts = --interaction=nonstopmode -recorder #--file-line-error
tex_1opt = "$(tex_opts)" # must be quoted, passing to shell script
dev_null = </dev/null    # when we don't call tex directly.
# would be better extra_bin:=./extra-bin or extra_bin:=../extra-bin ??
extra_bin := ./
ht_bin := ../bin/ht/unix
PATH := $(shell echo $$PATH)
## setting PATH as TeX Live 2016 (DVD) does not ship with 'xhlatex'
## and look for xmlint/vcss in current dir
export PATH:=$(ht_bin):$(extra_bin):$(PATH)


HTTEX := ht "tex $(tex_opts)"  # set tex options for plain tex

# option '-d./' removed from (x)htlatex call. It does not make sense
# -d in current dir
#
# dev_null should be fixed. 'ht' call requires 3 args? 

default: all

common = tex4ht-cpright.tex common.tex common-code.tex ProTex.sty AlProTex.sty
common_info = $(common) common-info.tex
derived = 

derived += $(tex4ht_4ht_derived)
tex4ht_4ht_derived = \
  algorithmic.4ht biblatex.4ht book.4ht frenchb.4ht \
  geometry.4ht graphicx.4ht hyperref.4ht latex.4ht lettrine.4ht listings.4ht \
  memoir.4ht multicol.4ht quoting.4ht reading.4ht \
  scrartcl.4ht scrbook.4ht scrreprt.4ht spanish.4ht subscript.4ht \
  titlesec.4ht tocloft.4ht wrapfig.4ht usepackage.4ht
# xx and many, many more.

derived += $(tex4ht_bibtex2_derived)
tex4ht_bibtex2_derived = bibtex2.4ht

derived += $(tex4ht_c_derived)
tex4ht_c_derived = tex4ht.c

derived += $(tex4ht_cond4ht_derived)
tex4ht_cond4ht_derived = cond4ht.4ht mktex4ht.4ht

derived += $(tex4ht_docbook_derived)
tex4ht_docbook_derived = docbook.4ht docbook-math.4ht docbook-mml.4ht

derived += $(tex4ht_docbook_xtpipes_derived)
tex4ht_docbook_xtpipes_derived = docbook.4xt DbUtilities.java

derived += $(tex4ht_env_derived)
tex4ht_env_derived = tex4ht.env-unix tex4ht.env-win32 tex4ht.env

derived += $(tex4ht_fonts_cjk_derived)
tex4ht_fonts_cjk_derived = tex4ht-fonts-cjk.html # and lots more

derived += $(tex4ht_fonts_cjk_utf8_derived)
tex4ht_fonts_cjk_utf8_derived = tex4ht-fonts-cjk-utf8.html # and lots more

# noncjk.tex \input's modern, but seems more maintainable
# to have separate lists.
derived += $(tex4ht_fonts_noncjk_derived)
tex4ht_fonts_noncjk_derived = \
  tex4ht.dir/texmf/tex4ht/ht-fonts/alias/ec/eccc.htf \
  tex4ht.dir/texmf/tex4ht/ht-fonts/unicode/ec/eccc-uni.htf \
  tex4ht.dir/texmf/tex4ht/ht-fonts/alias/t1fonts/ClearSans-BoldItalic-lf-t1.htf \
  tex4ht.dir/texmf/tex4ht/ht-fonts/alias/t1fonts/ipxg-r-t1.htf \
  tex4ht.dir/texmf/tex4ht/ht-fonts/unicode/jknappen/tc/tcrm.htf \
  tex4ht.dir/texmf/tex4ht/ht-fonts/unicode/adobe/courier/pcrro8r.htf \
  SearchFonts.java lm-htf.tex
tex4ht_fonts_modern_derived = \
  tex4ht.dir/texmf/tex4ht/ht-fonts/unicode/lm/l7x-lmcsc.htf \
  tex4ht.dir/texmf/tex4ht/ht-fonts/unicode/lm/l7x-lm.htf  
# xx and lots more
# whither tmp?  how change target dir?  what happened to cmtex.htf?  etc.

# htcmd not used
#derived += $(tex4ht_htcmd_derived)
#tex4ht_htcmd_derived = htcmd.c

derived += $(tex4ht_html_speech_derived)
tex4ht_html_speech_derived = html-speech.4ht html-speech-math.4ht emacspeak.4ht

derived += $(tex4ht_html_speech_xtpipes_derived)
tex4ht_html_speech_xtpipes_derived = htspk.4xt HtSpk.java

derived += $(tex4ht_html0_derived)
tex4ht_html0_derived = html0.4ht

derived += $(tex4ht_html32_derived)
tex4ht_html32_derived = html32.4ht html32-math.4ht 

derived += $(tex4ht_html4_derived)
tex4ht_html4_derived = \
  html4.4ht html4-math.4ht html4-uni.4ht \
  html4-l2-url.4ht html4-russian-accents.4ht \
  onmouseover.4ht exerqz.4ht  

#xx big changes for unknown reasons derived += $(tex4ht_info_derived)
tex4ht_info_derived = info4ht.4ht

derived += $(tex4ht_info_html4_derived)
tex4ht_info_html4_derived = infoht4.4ht

derived += $(tex4ht_info_javahelp_derived)
tex4ht_info_javahelp_derived = infojh.4ht

derived += $(tex4ht_info_mml_derived)
tex4ht_info_mml_derived = infomml.4ht

derived += $(tex4ht_info_ooffice_derived)
tex4ht_info_ooffice_derived = infoof.4ht

derived += $(tex4ht_info_svg_derived)
tex4ht_info_svg_derived = infosvg.4ht

derived += $(tex4ht_javahelp_derived)
tex4ht_javahelp_derived = javahelp.4ht javahelp-a.4ht

derived += $(tex4ht_javahelp_xtpipes_derived)
tex4ht_javahelp_xtpipes_derived = javahelp.4xt

derived += $(tex4ht_jsmath_derived)
tex4ht_jsmath_derived = jsmath.4ht html-jsmath.4ht

derived += $(tex4ht_jsml_xtpipes_derived)
tex4ht_jsml_xtpipes_derived = \
  jsml.4xt \
  HtJsml.java GroupMn.java JsmlFilter.java JsmlMathBreak.java

derived += $(tex4ht_jsml_derived)
tex4ht_jsml_derived = jsml.4ht jsml-math.4ht

derived += $(tex4ht_mathltx_derived)
tex4ht_mathltx_derived = mathltx.4ht html-mltx.4ht

derived += $(tex4ht_mathml_derived)
tex4ht_mathml_derived = mathml.4ht html-mml.4ht

derived += $(tex4ht_mathplayer_derived)
tex4ht_mathplayer_derived = mathplayer.4ht

derived += $(tex4ht_mkht_derived)
tex4ht_mkht_derived = mkht.4ht mk4ht.perl mkht-scripts.4ht

derived += $(tex4ht_moz_derived)
tex4ht_moz_derived = mozilla.4ht

derived += $(tex4ht_oo_xtpipes_derived)
tex4ht_oo_xtpipes_derived = \
   oo-math.4xt oo-text.4xt \
   OoUtilities.java OomFilter.java OoFilter.java

derived += $(tex4ht_ooffice_derived)
tex4ht_ooffice_derived = ooffice.4ht ooffice-mml.4ht

derived += $(tex4ht_ooimpress_derived)
tex4ht_ooimpress_derived = ooimpress.4ht

derived += $(tex4ht_options_derived)
tex4ht_options_derived = tex4ht.4ht

derived += $(tex4ht_sty_derived)
tex4ht_sty_derived = tex4ht.sty

derived += $(tex4ht_svg_derived)
tex4ht_svg_derived = svg.4ht html4-svg.4ht

derived += $(tex4ht_t4ht_derived)
tex4ht_t4ht_derived = t4ht.c

derived += $(tex4ht_tei_derived)
tex4ht_tei_derived = tei.4ht tei-mml.4ht tei-math.4ht tei-mmltei.4ht

derived += $(tex4ht_unicode_derived)
tex4ht_unicode_derived = unicode.4ht

derived += $(tex4ht_word_derived)
tex4ht_word_derived = htmlw.4ht

derived += $(tex4ht_xhtml_xtpipes_derived)
tex4ht_xhtml_xtpipes_derived = xhtml.4xt XhtmlEmails.java

derived += $(tex4ht_xhtmml_xtpipes_derived)
tex4ht_xhtmml_xtpipes_derived = xhtmml.4xt XhtmmlUtilities.java

# wripro.tex generates nothing (not literate).

derived += $(xtpipes_derived)
xtpipes_derived = \
  $(wd)/xtpipes.java \
  $(wd)/xtpipes/FileInfo.java \
  $(wd)/xtpipes/InputObject.java \
  $(wd)/xtpipes/Xtpipes.java \
  $(wd)/xtpipes/XtpipesPrintWriter.java \
  $(wd)/xtpipes/XtpipesUni.java \
  $(wd)/xtpipes/util/ScriptsManager.java \
  $(wd)/xtpipes/util/ScriptsManagerLH.java \
  xtpipes-default.4xt \
  xtpipes-map.dtd \
  xtpipes.dtd \

targets-debug = 4ht bibtex2 c cond4ht docbook docbook-xtpipes 
targets-debug += env fonts-cjk fonts-cjk-utf8 fonts-noncjk
targets-debug += htcmd html-speech html-speech-xtpipes
targets-debug += html0 html32 html4
targets-debug += info-html4 info-javahelp info-mml info-ooffice info-svg info
targest-debug += javahelp javahelp-xtpipes jsmath jsml-xtpipes jsml
targets-debug += mathltx mathml mathplayer
targets-debug += mkht moz oo-xtpipes ooffice ooimpress options sty
targets-debug += svg t4ht tei unicode word
targets-debug += xhtml-xtpipes xhtmml-xtpipes xtpipes

## order
# 1 - cond4ht
# 2 - 4ht
# 3 - (the rest) 
targets-ord = cond4ht # no html
targets-ord += 4ht # no html
targets-ord += info info-mml info-html4 info-javahelp info-ooffice info-svg
targets-ord += c # no html
targets-ord += t4ht
targets-ord += docbook
targets-ord += bibtex2
targets-ord += env
targets-ord += htcmd
targets-ord += fonts-cjk fonts-cjk-utf8 fonts-noncjk
targets-ord += html-speech
targets-ord += html0 html32 html4
targets-ord += javahelp
targets-ord += jsmath
targets-ord += jsml
targets-ord += mathltx mathml mathplayer
targets-ord += mkht
targets-ord += moz
targets-ord += ooffice
targets-ord += ooimpress
targets-ord += options
targets-ord += sty
targets-ord += svg
targets-ord += tei
targets-ord += unicode
targets-ord += word
# xtpipes
targets-ord += docbook-xtpipes
targets-ord += html-speech-xtpipes
targets-ord += javahelp-xtpipes
targets-ord += jsml-xtpipes
targets-ord += oo-xtpipes
targets-ord += xhtml-xtpipes xhtmml-xtpipes
targets-ord += xtpipes


# 
all: $(derived)
all-debug: $(targets-debug)
all-debug-ord: $(targets-ord)

4ht $(tex4ht_4ht_derived): tex4ht-4ht.tex $(common)
	tex $(tex_opts) $<

4ht-doc: tex4ht-4ht.tex $(common)
	$(HTTEX) $< ""

bibtex2 $(tex4ht_bibtex2_derived): tex4ht-bibtex2.tex $(common)
	latex $(tex_opts) $<

bibtex2-doc: tex4ht-bibtex2.tex $(common)
	htlatex $(tex_opts) $<

c $(tex4ht_c_derived): tex4ht-c.tex $(common)
	tex $(tex_opts) $<

c-doc: tex4ht-c.tex $(common)
	$(HTTEX) $< ""

cond4ht $(tex4ht_cond4ht_derived): tex4ht-cond4ht.tex $(common)
	tex $(tex_opts) $<
	tex $(tex_opts) cond4ht.4ht

cond4ht-doc: tex4ht-cond4ht.tex

docbook $(tex4ht_docbook_derived): tex4ht-docbook.tex $(common)
	xhlatex $< "html,3" "" "" $(tex_1opt)

docbook-xtpipes $(tex4ht_docbook_xtpipes_derived): tex4ht-docbook-xtpipes.tex $(common)
	xhlatex $< "html,3" "" "" $(tex_1opt)

env $(tex4ht_env_derived): tex4ht-env.tex $(common)
	htlatex $< "xhtml,3" "" "" $(tex_1opt)

fonts-cjk $(tex4ht_fonts_cjk_derived): tex4ht-fonts-cjk.tex
	$(HTTEX) $<  $(dev_null)

fonts-cjk-utf8 $(tex4ht_fonts_cjk_utf8_derived): tex4ht-fonts-cjk-utf8.tex
	$(HTTEX) $< $(dev_null)

fonts-noncjk $(tex4ht_fonts_noncjk_derived) $(tex4ht_fonts_modern_derived): \
  tex4ht-fonts-noncjk.tex tex4ht-fonts-modern.tex $(common)
	$(HTTEX) $< $(dev_null)

htcmd (tex4ht_htcmd_derived): tex4ht-htcmd.tex $(common)
	$(HTTEX) $< $(dev_null)

html-speech $(tex4ht_html_speech_derived): tex4ht-html-speech.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

html-speech-xtpipes $(tex4ht_html_speech_xtpipes_derived): tex4ht-html-speech-xtpipes.tex $(common)
	htlatex $< "html,next,3" "" "" $(tex_1opt)

html0 $(tex4ht_html0_derived): tex4ht-html0.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

html32 $(tex4ht_html32_derived): tex4ht-html32.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)


html4 $(tex4ht_html4_derived): tex4ht-html4.tex $(common)
	latex $(tex_opts) $<

html4-doc: tex4ht-html4.tex $(common)
	xhlatex $< "xhtml,3,sections+" "" "" $(tex_1opt)

info-html4 $(tex4ht_info_html4_derived): tex4ht-info-html4.tex $(common_info)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

info-javahelp $(tex4ht_info_javahelp_derived): tex4ht-info-javahelp.tex $(common_info)
	htlatex $< "html,sections+" "" "" $(tex_1opt)

info-mml $(tex4ht_info_mml_derived): tex4ht-info-mml.tex $(common_info)
	htlatex $< "html,sections+" "" "" $(tex_1opt)

info-ooffice $(tex4ht_info_ooffice_derived): tex4ht-info-ooffice.tex $(common_info)
	htlatex $< "html,sections+" "" "" $(tex_1opt)

info-svg $(tex4ht_info_svg_derived): tex4ht-info-svg.tex $(common_info)
	htlatex $< "html,sections+" "" "" $(tex_1opt)

info $(tex4ht_info_derived): tex4ht-info.tex $(common) 
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

javahelp $(tex4ht_javahelp_derived): tex4ht-javahelp.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

javahelp-xtpipes $(tex4ht_javahelp_xtpipes_derived): tex4ht-javahelp-xtpipes.tex $(common)
	htlatex $< "xhtml,next,3" "" "" $(tex_1opt)

jsmath $(tex4ht_jsmath_derived): tex4ht-jsmath.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

jsml-xtpipes $(tex4ht_jsml_xtpipes_derived): tex4ht-jsml-xtpipes.tex $(common)
	htlatex $< "xhtml,next,3" "" "" $(tex_1opt)

jsml $(tex4ht_jsml_derived): tex4ht-jsml.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

mathltx $(tex4ht_mathltx_derived): tex4ht-mathltx.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

mathml $(tex4ht_mathml_derived): tex4ht-mathml.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

mathplayer $(tex4ht_mathplayer_derived): tex4ht-mathplayer.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

mkht $(tex4ht_mkht_derived): tex4ht-mkht.tex $(common)
	latex $(tex_opts) $<
	perl -c mk4ht.perl  # syntax check
	latex $(tex_opts) mkht-scripts.4ht

moz $(tex4ht_moz_derived): tex4ht-moz.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

oo-xtpipes $(tex4ht_oo_xtpipes_derived): tex4ht-oo-xtpipes.tex $(common)
	htlatex $< "xhtml,next,3" "" "" $(tex_1opt)

ooffice $(tex4ht_ooffice_derived): tex4ht-ooffice.tex $(common)
	htlatex $< "xhtml,4,sections+" "" "" $(tex_1opt)

ooimpress $(tex4ht_ooimpress_derived): tex4ht-ooimpress.tex $(common)
	htlatex $< "xhtml,4,sections+" "" "" $(tex_1opt)

options $(tex4ht_options_derived): tex4ht-options.tex $(common)
## TODO: set $(tex_1opt)
	mk4ht xhlatex $< $(dev_null)

sty $(tex4ht_sty_derived): tex4ht-sty.tex $(common)
	$(HTTEX) $< $(dev_null)

svg $(tex4ht_svg_derived): tex4ht-svg.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

t4ht $(tex4ht_t4ht_derived): tex4ht-t4ht.tex $(common)
	$(HTTEX) $< $(dev_null)

tei $(tex4ht_tei_derived): tex4ht-tei.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

unicode $(tex4ht_unicode_derived): tex4ht-unicode.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

word $(tex4ht_word_derived): tex4ht-word.tex $(common)
	xhlatex $< "html,3,sections+" "" "" $(tex_1opt)

xhtml-xtpipes $(tex4ht_xhtml_xtpipes_derived): tex4ht-xhtml-xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "" $(tex_1opt)

xhtmml-xtpipes $(tex4ht_xhtmml_xtpipes_derived): tex4ht-xhtmml-xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "" $(tex_1opt)

xtpipes $(xtpipes_derived): xtpipes.tex $(common)
	htlatex $< "xhtml,3,next" "" "" $(tex_1opt)
# Derived files are generated in . and $(wd).
# (corresponds to src/java for xtpipes.tex)

# 
destdir = ..
dest_texmf = $(destdir)/texmf/tex/generic/tex4ht
dest_4ht = $(destdir)/texmf/tex4ht
dest_base = $(dest_4ht)/base
dest_xtpipes = $(dest_4ht)/xtpipes
dest_src = $(destdir)/src
dest_java = $(dest_src)/java
#
update = cp -pr
mkdir = install -d
#
update: all
	$(update) $(tex4ht_bibtex2_derived) $(dest_src)/
#
	$(update) $(tex4ht_c_derived) $(dest_src)/
#
	$(update) $(tex4ht_cond4ht_derived) $(dest_texmf)/
#
	$(update) docbook.4xt $(dest_xtpipes)/
	$(update) DbUtilities.java $(dest_java)/
#
	$(update) $(tex4ht_docbook_derived) $(dest_texmf)/
#
	$(mkdir) $(dest_base)/unix $(dest_base)/win32
	$(update) tex4ht.env-unix $(dest_base)/unix/
	$(update) tex4ht.env-win32 $(dest_base)/win32/
#
	$(update) $(tex4ht_html_speech_xtpipes_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_html_speech_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_html0_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_html32_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_html4_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_mml_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_ooffice_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_svg_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_info_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_javahelp_xtpipes_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_javahelp_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_jsmath_derived) $(dest_texmf)/
#
	$(update) jsml.4xt $(dest_xtpipes)/
	$(update) HtJsml.java GroupMn.java JsmlFilter.java \
	          JsmlMathBreak.java $(dest_java)/
#
	$(update) $(tex4ht_jsml_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_mathltx_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_mathplayer_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_moz_derived) $(dest_texmf)/
#
	$(update) oo-text.4xt oo-math.4xt $(dest_xtpipes)/
	$(update) OoUtilities.java OomFilter.java $(dest_java)/
#
	$(update) $(tex4ht_ooffice_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_ooimpress_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_options_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_sty_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_svg_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_t4ht_derived) $(dest_src/
#
	$(update) $(tex4ht_tei_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_unicode_derived) $(dest_texmf)/
#
	$(update) $(tex4ht_word_derived) $(dest_texmf)/
#
	$(update) xhtml.4xt $(dest_xtpipes)/
	$(update) XhtmlEmails.java $(dest_java)/
#
	$(update) xhtmml.4xt $(dest_xtpipes)/
	$(update) XhtmmlUtilities.java $(dest_java)/
#
# this has to be done last. Does anything else use $(wd)? We'll see.
	rmdir $(wd)/bin
	$(update) $(wd)/* $(dest_java)/
	$(update) xtpipes.dtd xtpipes-map.dtd xtpipes-default.4xt 
	  $(dest_xtpipes)/

#clean: mostlyclean
#clean: clean-derived
clean:
	rm -rf $(wd)
	rm -f *.4ct *.4tc *.aux *.css *.dvi *.idv *.lg *.log *.tmp *.trc *.xref
	rm -f *.4es *.bat *.unix *.htf *.html *.png tmp
	rm -f *.fls *.derived *.dep
	rm -rf $(htmldir)    # html files
	rm -rf $(deriveddir) # derived files
	rm -rf $(xtpipesdir) # xtpipes files
	rm -f info*.4ht      # redundant
	rm -rf tex4ht.dir
	rm -f tex4ht.4ht tex4ht.jar

clean1:
	rm -f $(f).[0-s]* $(f).[u-z]* $(f).trc

# to compare newly-built files with what's installed.
diff_files = $(derived) # lots of changes to be figured out ...
diff_files = $(tex4ht_mathml_derived) $(tex4ht_html_speech_derived) \
             $(tex4ht_jsml_derived) $(tex4ht_mathltx_derived)
inst_dir = /usr/local/texlive/dev/texmf-dist/tex/generic/tex4ht
#
diff = diff -u0 --ignore-all-space --ignore-blank-lines \
  --ignore-matching-lines='write-1.version\|, generated from\|Copyright'
#
# the --ignore-matching-lines only works when that's the only change in
# the hunk, so ignore them all explicitly. also ignore commented changes.
diff-all:
	-for f in $(diff_files); do $(diff) $(inst_dir)/$$f .; done \
	| tee /tmp/u | egrep -v '^ *[-+]%|write-1.version'

# diff one file specified as d=
diff1:
	$(diff) $(inst_dir)/$(d) .

mostlyclean:
	rm -f $(derived)

testpath:
	echo $$PATH

# derived files from fls
derived:
	for f in *.fls ; do \
	grep -v  $${f%.*} $$f | awk '/OUTPUT/ { print $$2 }' > $${f%.*}.derived ;  \
done

# alternative to mostlyclean.
clean-derived:
	for f in *.fls; do \
	grep -v  $${f%.*} $$f | awk '/OUTPUT/ { print $$2 }' |  xargs rm -f ;  \
done

# dependences list from fls
dep:
	for f in *.fls ; do \
	grep -v  $${f%.*} $$f | awk '/INPUT/ { print $$2 }' > tee $${f%.*}.dep ;  \
done

## move *.html files to ./htmldir subfolder
## process lg file
htmldir:
	for f in *.lg ; do \
	echo Processing $$f && mkdir -p $(htmldir)/$${f%.*} \
	&& grep "File: $${f%.*}" $$f | awk -v outdir=$(htmldir)/$${f%.*} '{system("[ -f "$$2" ] &&  mv -f " $$2" "outdir)}'  ; \
done

## move derived files to ./derived.dir
## process derived files
deriveddir: derived
	for f in *.derived ; do \
	echo $$f && mkdir -p $(deriveddir)/$${f%.*} \
	&& awk -v outdir=$(deriveddir)/$${f%.*} '{system("[ -f "$$0" ] &&  mv -f " $$0" "outdir)}' $$f ; \
done

checklog:
	for f in *.log ; do \
	grep -s -i 'warning' $$f  ; \
done

