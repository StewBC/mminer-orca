# Settings
PROGRAM := MMINER
SRCDIR := src
TARGETOBJDIR := obj
TEMPLATE := apple2/template.po
DISK := mminer.po
VOLUME := MANIC
CADIUS := $(CADIUS)
ORCA := $(ORACInclude)
SED := $(SED)
AWK := $(AWK)
EMUDIR := $(APPLEWIN_HOME)
EMU := applewin.exe -d1 $(DISK)


all:	$(PROGRAM)

ifeq ($(shell echo),)
  MKDIR = mkdir -p $1
  RMDIR = rmdir $1
  RMFILES = $(RM) $1
	CP = cp $1
else
  MKDIR = mkdir $(subst /,\,$1)
  RMDIR = rmdir /S /Q $(subst /,\,$1)
  RMFILES = $(if $1,del /f /q $(subst /,\,$1))
  CP = copy $(subst /,\,$1)
endif

define NEWLINE


endef

SOURCES += $(wildcard $(SRCDIR)/*.asm)
SOURCES := $(filter-out $(SRCDIR)/mminer.asm,$(SOURCES))
SOURCES := $(SRCDIR)/mminer.asm $(SOURCES)
OBJECTS += $(subst .asm,.ROOT,$(subst $(SRCDIR),$(TARGETOBJDIR),$(SOURCES)))

vpath %.asm $(SRCDIR)

$(TARGETOBJDIR):
	$(call MKDIR,$@)

$(TARGETOBJDIR)/%.ROOT: %.asm $(wildcard $(SRCDIR)/*.s) $(wildcard $(SRCDIR)/*.mac) | $(TARGETOBJDIR)
	iix assemble $< keep=$(subst /,:,$(basename $@))

$(PROGRAM): $(OBJECTS)
	-$(call RMFILES,$(PROGRAM))
	iix link +S $(OBJECTS) keep=$@ > debug0.map
	iix makebin $@

.PHONY: all dsk test macros

all: $(PROGRAM)

dsk: $(PROGRAM)
	$(call CP,$(TEMPLATE) $(DISK))
	$(CADIUS) ADDFILE $(DISK) /$(VOLUME) ./$(PROGRAM)

test: dsk
	$(SED) '9{:a;N;$$!ba;s/\n/ /g; s/\(\w\+\) . .. .. \(\w\+\)\s*/0x\1 \2\n/g;}' debug0.map > temp.map
	$(AWK) --non-decimal-data 'NR>8 {$$1 += 0x4000; printf "%x %s\n", $$1, $$2}' temp.map > debug.map
	$(call RMFILES,temp.map)
	$(call CP,debug.map $(EMUDIR)/A2_USER1.SYM)
	$(EMUDIR)/$(EMU)

macros:
	$(foreach FILE, $(SOURCES), iix macgen $(FILE) $(subst .asm,.mac,$(FILE)) $(ORACInclude)/m16= src/Macros/macros.s ${NEWLINE})

clean:
	-$(call RMFILES,$(OBJECTS))
	-$(call RMFILES,$(addsuffix .A,$(basename $(OBJECTS))))
	-$(call RMFILES,debug*.map)
	-$(call RMFILES,$(PROGRAM))
	-$(call RMFILES,$(DISK))

zap: clean
	-$(call RMDIR,$(TARGETOBJDIR))
