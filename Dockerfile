# ===========================================
# infotechsoft/mritools 
# ===========================================
ARG NEURODEBIAN_VERSION=nd17.10-non-free
FROM neurodebian:${NEURODEBIAN_VERSION}

LABEL name="tjtaylor/mritools" \
	release-date="2017-12-05" \
	description="Neurodebian-based MRI Tools" \
	mritools.neurodebian.url="http://neuro.debian.net/index.html" \
    mritools.fsl.url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL" \
	mritools.fsl.docs="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslOverview" \
    mritools.pydicom.url="https://github.com/pydicom/pydicom" \
    mritools.pydicom.docs="https://pydicom.readthedocs.io/en/stable/" \
    mritools.convert3d.url="http://www.itksnap.org/pmwiki/pmwiki.php?n=Convert3D.Convert3D" \
    mritools.convert3d.docs="https://sourceforge.net/p/c3d/git/ci/master/tree/doc/c3d.md" \
    mritools.dcmtk.url="https://github.com/DCMTK/dcmtk" \
	mritools.dcmtk.docs="http://support.dcmtk.org/docs/index.html" \
	mritools.dcm2niix.url="https://github.com/rordenlab/dcm2niix" \
    mritools.dcm2niix.docs="https://www.nitrc.org/plugins/mwiki/index.php/dcm2nii:MainPage" \
	maintainer="Thomas J. Taylor <thomas.taylor@miami.edu>"

RUN apt-get update && \
	apt-get -y install \
		convert3d \
		dcmtk \
		dcm2niix \
		fsl-complete \
		python-dicom && \
	mkdir /work && \
	echo ". /etc/fsl/5.0/fsl.sh" >> /root/.bashrc

VOLUME /work
WORKDIR /work