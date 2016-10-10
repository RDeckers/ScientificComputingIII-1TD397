rwildcard=$(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *, %,$2),$d))
directories=$(sort $(dir $(wildcard $/*)))
ifeq ($(OS),Windows_NT)
	FIX_PATH = $(subst /,\,$1)
	REPORT = @echo $1
	CHK_DIR_EXISTS = if not exist "$(strip $1)" mkdir "$(strip $1)"
	NUKE = rmdir /s /q
	COPY_DIR = xcopy $(call FIX_PATH,$1 $2) /E /H /Y
	COPY_CONTENT = xcopy /s /Y $(call FIX_PATH,$1 $2)
	COPY = xcopy $(call FIX_PATH,$1 $2) /Y
else
	REPORT = @echo "\033[4;1;37m$1\033[0m"
	CHK_DIR_EXISTS = test -d $1 || mkdir -p $1
	NUKE = rm -r $1
	COPY_DIR = cp -rv $1 $2
	FIX_PATH = $1
endif

PROJECT_DIR :=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
PLOTS_DIR := $(PROJECT_DIR)plots


PLOTS_GNUPLOT := $(call rwildcard, $(PLOTS_DIR), *.gnuplot)
PLOTS_PNG := $(patsubst %.gnuplot, %.png, $(PLOTS_GNUPLOT))

LD_FLAGS += --std=c++11 -march=native -lOpenCL -lclu -lutilities -lm -ltiff -lxml2 -L $(INSTALL_LIB_DIR)
CPP_FLAGS += --std=c++11 -O2 -pipe -march=native -I $(PROJECT_DIR)headers -I $(INSTALL_INCLUDE_DIR) -I /usr/include/libxml2 -I Z:/msys64/mingw64/include/libxml2/

.SECONDARY: $(OBJ_FILES) $(DATA_FILES)

binaries: $(BINARIES)

report: plots
	$(call REPORT, Making PDF)
	pdflatex -interaction=nonstopmode $(PROJECT_DIR)report/report.tex

plots: $(PLOTS_PNG)

$(PLOTS_DIR)/%.png : $(PLOTS_DIR)/%.gnuplot
	$(call REPORT,Building $@)
	gnuplot -e "output_file='$@';term_type='png'" -c "$(patsubst %.png,%.gnuplot,$@)"
