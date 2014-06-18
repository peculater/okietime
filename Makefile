CP=cp
M4=m4
MKDIR_P=mkdir -p
RM=rm
WEBSITE_DIR=/var/www/okietime

all: index

index: output
	$(M4) < src/index.html.m4 > output/index.html

install: index
	$(CP)  output/index.html  $(WEBSITE_DIR)

output:
	$(MKDIR_P) output

clean:
	$(RM) -Rf output

distclean: clean

