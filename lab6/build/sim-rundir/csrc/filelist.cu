PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _974671_archive_1.so
_974671_archive_1.so : archive.0/_974671_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -Bsymbolic  -o .//../simv.daidir//_974671_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_974671_archive_1.so $@





O0_OBJS =

$(O0_OBJS) : %.o: %.c
	$(CC_CG) $(CFLAGS_O0) -c -o $@ $<
 

%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \
objs/udps/wizTW.o objs/udps/KCFDW.o objs/udps/NyrWV.o objs/udps/bNnRR.o 

CU_LVL_OBJS = \


MAIN_OBJS = \
objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

