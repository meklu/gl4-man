XML := $(wildcard svn/*.xml)
MAN := $(XML:svn/%.xml=out/%.3G)

.phony : all build install clean

all : build

build : $(MAN)

out/%.3G : svn/%.xml
	cd out/ && xsltproc ../preproc.xsl $(@:out/%.3G=../svn/%.xml) | xsltproc /usr/share/sgml/docbook/xsl-ns-stylesheets/manpages/docbook.xsl -

install :
	install -d $(PREFIX)/share/man/man3G/
	install -Dm 644 $(wildcard out/*.3G) $(PREFIX)/share/man/man3G/

clean :
	$(RM) $(MAN) && $(RM) -r out/
