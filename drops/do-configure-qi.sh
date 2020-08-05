mkdir Drops-Build-Serial
cd Drops-Build-Serial

sudo cmake \
	-D TRILINOS_PATH:FILEPATH="~/Trilinos/" \
	-D VTK_DIR:FILEPATH="~/VTK-Release-build/" \
	-D Matlab_ROOT_DIR:FILEPATH="/usr/local/MATLAB/R2020a/" \
	-D DROPS_BUILD_TYPE:STRING="RELEASE" \
	-D MPI:BOOL=OFF \
	../drops/src/

