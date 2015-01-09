# Test makefile for cpptraj
#include ../config.h

test.general:
	@-cd Test_General && sh ./RunTest.sh.sh $(OPT)

test.strip:
	@-cd Test_Strip && sh ./RunTest.sh.sh $(OPT)

test.brokentraj:
	@-cd Test_BrokenTraj && sh ./RunTest.sh.sh $(OPT)

test.traj:
	@-cd Test_TrajinOffset && sh ./RunTest.sh.sh $(OPT)

test.remdnetcdf:
	@-cd Test_RemdTraj && sh ./RunTest.sh.sh $(OPT)

test.framerange:
	@-cd Test_trajout_framerange && sh ./RunTest.sh.sh $(OPT)

test.perres:
	@-cd Test_PerResRMSD && sh ./RunTest.sh.sh $(OPT)

test.dssp:
	@-cd Test_DSSP && sh ./RunTest.sh.sh $(OPT)

test.center:
	@-cd Test_Center && sh ./RunTest.sh.sh $(OPT)

test.hbond:
	@-cd Test_Hbond && sh ./RunTest.sh.sh $(OPT)

test.image:
	@-cd Test_Image && sh ./RunTest.sh.sh $(OPT)

test.comprehensive:
	@-cd Test_Comprehensive && sh ./RunTest.sh.sh $(OPT)

test.netcdftraj:
	@-cd Test_NetcdfTraj && sh ./RunTest.sh.sh $(OPT)

test.surf:
	@-cd Test_Surf && sh ./RunTest.sh.sh $(OPT)

test.radgyr:
	@-cd Test_Radgyr && sh ./RunTest.sh.sh $(OPT)

test.mask:
	@-cd Test_Mask && sh ./RunTest.sh.sh $(OPT)

test.closest:
	@-cd Test_Closest && sh ./RunTest.sh.sh $(OPT)

test.rmsd:
	@-cd Test_RMSD && sh ./RunTest.sh.sh $(OPT)

test.outtraj:
	@-cd Test_Outtraj && sh ./RunTest.sh.sh $(OPT)

test.datafile:
	@-cd Test_Datafile && sh ./RunTest.sh.sh $(OPT)

#test.avgref:
#	@cd Test_AvgRef && sh ./RunTest.sh.sh $(OPT)

test.mol2:
	@-cd Test_Mol2 && sh ./RunTest.sh.sh $(OPT)

test.nastruct:
	@-cd Test_NAstruct && sh ./RunTest.sh.sh $(OPT)

test.pucker:
	@-cd Test_Pucker && sh ./RunTest.sh.sh $(OPT)

test.atommap:
	@-cd Test_AtomMap && sh ./RunTest.sh.sh $(OPT)

test.2drms:
	@-cd Test_2DRMS && sh ./RunTest.sh.sh $(OPT)

test.average:
	@-cd Test_Average && sh ./RunTest.sh.sh $(OPT)

test.radial:
	@-cd Test_Radial && sh ./RunTest.sh.sh $(OPT)

test.hist:
	@-cd Test_Hist && sh ./RunTest.sh.sh $(OPT)

test.ncrestart:
	@-cd Test_NCrestart && sh ./RunTest.sh.sh $(OPT)

test.drmsd:
	@-cd Test_DRMSD && sh ./RunTest.sh.sh $(OPT)

test.jcoupling:
	@-cd Test_Jcoupling && sh ./RunTest.sh.sh $(OPT)

test.cluster:
	@-cd Test_Cluster && sh ./RunTest.sh.sh $(OPT)

test.ired:
	@-cd Test_IRED && sh ./RunTest.sh.sh $(OPT)

test.molsurf:
	@-cd Test_Molsurf && sh ./RunTest.sh.sh $(OPT)

test.charmm:
	@-cd Test_Charmm && sh ./RunTest.sh.sh $(OPT)

test.rotdif:
	@-cd Test_Rotdif && sh ./RunTest.sh.sh $(OPT)

test.corr:
	@cd Test_Corr && sh ./RunTest.sh.sh $(OPT)

test.checkstructure:
	@cd Test_CheckStructure && sh ./RunTest.sh.sh $(OPT)

test.runavg:
	@cd Test_Runavg && sh ./RunTest.sh.sh $(OPT)

test.analrunavg:
	@cd Test_AnalysisRunAvg && sh ./RunTest.sh.sh $(OPT)

test.rmsavgcorr:
	@cd Test_RmsAvgCorr && sh ./RunTest.sh.sh $(OPT)

test.contacts:
	@cd Test_Contacts && sh ./RunTest.sh.sh $(OPT)

test.principal:
	@cd Test_Principal && sh ./RunTest.sh.sh $(OPT)

test.clusterdihedral:
	@cd Test_ClusterDihedral && sh ./RunTest.sh.sh $(OPT)

test.vector:
	@cd Test_Vector && sh ./RunTest.sh.sh $(OPT)

test.matrix:
	@cd Test_Matrix && sh ./RunTest.sh.sh $(OPT)

test.atomicfluct:
	@cd Test_AtomicFluct && sh ./RunTest.sh.sh $(OPT)

test.grid:
	@cd Test_Grid && sh ./RunTest.sh.sh $(OPT)

test.unwrap:
	@cd Test_Unwrap && sh ./RunTest.sh.sh $(OPT)

test.project:
	@cd Test_Project && sh ./RunTest.sh.sh $(OPT)

test.analyzemodes:
	@cd Test_Analyze_Modes && sh ./RunTest.sh.sh $(OPT)

test.watershell:
	@cd Test_Watershell && sh ./RunTest.sh.sh $(OPT)

test.diffusion:
	@cd Test_Diffusion && sh ./RunTest.sh.sh $(OPT)

test.volmap:
	@cd Test_Volmap && sh ./RunTest.sh.sh $(OPT)

test.lie:
	@cd Test_LIE && sh ./RunTest.sh.sh $(OPT)

test.spam:
	@cd Test_SPAM && sh ./RunTest.sh.sh $(OPT)

test.randomizeions:
	@cd Test_RandomizeIons && sh ./RunTest.sh.sh $(OPT)

test.density:
	@cd Test_Density && sh ./RunTest.sh.sh $(OPT)

test.lipidorder:
	@cd Test_LipidOrder && sh ./RunTest.sh.sh $(OPT)

test.pairdist:
	@cd Test_PairDist && sh ./RunTest.sh.sh $(OPT)

# Only crucial/non-time-consuming tests should go here.
MAINTESTS=test.general \
          test.strip \
          test.brokentraj \
          test.traj \
          test.remdnetcdf \
          test.framerange \
          test.perres \
          test.dssp \
          test.hbond \
          test.ncrestart \
          test.image \
          test.surf \
          test.radgyr \
          test.mask \
          test.outtraj \
          test.charmm \
          test.rotdif \
          test.runavg \
          test.2drms \
          test.mol2 \
          test.nastruct \
          test.average \
          test.pucker \
          test.atommap \
          test.datafile \
          test.radial \
          test.hist \
          test.closest \
          test.drmsd \
          test.cluster \
          test.checkstructure \
          test.rmsavgcorr \
          test.vector \
          test.atomicfluct \
          test.grid \
          test.watershell \
          test.analrunavg \
          test.density \
          test.lipidorder \
          test.pairdist
# Every test should go here.
COMPLETETESTS=test.general \
              test.strip \
              test.brokentraj \
              test.traj \
              test.remdnetcdf \
              test.framerange \
              test.perres \
              test.dssp \
              test.center \
              test.hbond \
              test.ncrestart \
              test.image \
              test.surf \
              test.radgyr \
              test.mask \
              test.jcoupling \
              test.diffusion \
              test.outtraj \
              test.charmm \
              test.rotdif \
              test.comprehensive \
              test.netcdftraj \
              test.runavg \
              test.rmsd \
              test.2drms \
              test.mol2 \
              test.nastruct \
              test.average \
              test.pucker \
              test.atommap \
              test.datafile \
              test.radial \
              test.hist \
              test.closest \
              test.drmsd \
              test.cluster \
              test.ired \
              test.randomizeions \
              test.molsurf \
              test.corr \
              test.checkstructure \
              test.rmsavgcorr \
              test.contacts \
              test.principal \
              test.clusterdihedral \
              test.vector \
              test.matrix \
              test.atomicfluct \
              test.grid \
              test.unwrap \
              test.project \
              test.analyzemodes \
              test.watershell \
              test.analrunavg \
              test.volmap \
              test.spam \
              test.lie \
              test.density \
              test.lipidorder \
              test.pairdist

summary: MasterTest.sh
	@sh MasterTest.sh $(OPT) summary

#test.standalone: 
#	$(MAKE) test.complete OPT=standalone
#	@./Summary.sh standalone 

#test.main: $(MAINTESTS)

test.complete: $(COMPLETETESTS) summary

test:
	$(MAKE) test.complete OPT="-cpptraj $(CPPTRAJBIN)/cpptraj$(SFX)"

test.vg:
	$(MAKE) test.complete OPT="vg -cpptraj $(CPPTRAJBIN)/cpptraj$(SFX)"

#test.vg.standalone:
#	$(MAKE) test.complete OPT="standalone vg"
#	@./Summary.sh standalone vg


clean:
	@echo "Cleaning all test directories:"
	(find . -name 'test.out' -o -name 'valgrind.out' -o -name 'Thread.*' \
        -o -name 'Test_Results.dat' -o -name 'Test_Error.dat' | \
        while read dif ;\
        do \
            rm -f $$dif ;\
        done ;\
        )
	$(MAKE) test.complete OPT=clean

cleanprofile:
	@echo "Removing GNU profile files:"
	(find . -name 'libstdcxx-profile.*' | \
        while read dif ;\
        do \
            rm -f $$dif ;\
        done ;\
        )

