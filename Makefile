CP=cp
DIFF=diff
M4=m4
MKDIR_P=mkdir -p
RM=rm
WEBSITE_DIR=/var/www/okietime

all: output/index.html

output/index.html: output
	$(M4) < src/index.html.m4 > output/index.html

install: output/index.html
	$(CP)  output/index.html  $(WEBSITE_DIR)

output:
	$(MKDIR_P) output

clean:
	$(RM) -Rf output

distclean: clean

diff: output/index.html
	-$(DIFF) $(WEBSITE_DIR)/index.html output/index.html
