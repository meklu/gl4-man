SRC_URI := https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/docs/man4/
SRC_OPT := --username anonymous --password anonymous
SVN := svn

PREFIX := /usr/local

export PREFIX

.phony : all dirs build update prepare install clean

all : prepare build

prepare : dirs update

dirs : out svn

out :
	mkdir -p out

build : out
	$(MAKE) -f build.mak build

svn :
	$(SVN) co $(SRC_OPT) $(SRC_URI) svn

update : svn
	cd svn/ && $(SVN) $(SRC_OPT) up

install :
	$(MAKE) -f build.mak install

clean :
	$(MAKE) -f build.mak clean
