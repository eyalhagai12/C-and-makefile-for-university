# Variables
# compiler macro
CC = gcc

# files macro
basic = basicClassification.c
basic_obj = $(basic:.c=.o)

advancedloops = advancedClassificationLoop.c
advancedloops_obj = $(advancedloops:.c=.o)

advancedrec = advancedClassificationRecursion.c
advancedrec_obj = $(advancedrec:.c=.o)

# main file
main = main.c



# make all 
# ---------------------------------------------------------------------------------------------
all: mains maindloop maindrec
# --------------------------------------------------------------------------------------------- 



# create basic_obj
# ---------------------------------------------------------------------------------------------
$(basic_obj): $(basic)
	$(CC) -c -Wall -Werror $(basic)
# ---------------------------------------------------------------------------------------------


# shared loop library
# ---------------------------------------------------------------------------------------------
loopd: libclassloops.so

libclassloops.so: $(basic_obj:.o=Pic.o) $(advancedloops_obj:.o=Pic.o)
	$(CC) -shared -o libclassloops.so $(basic_obj:.o=Pic.o) $(advancedloops_obj:.o=Pic.o)

$(basic_obj:.o=Pic.o): $(basic) 
	$(CC) -c -fpic -Wall -Werror $(basic) -o $(basic_obj:.o=Pic.o) 

$(advancedloops_obj:.o=Pic.o): $(advancedloops)
	$(CC) -c -fpic -Wall -Werror $(advancedloops) -o $(advancedloops_obj:.o=Pic.o)
# ---------------------------------------------------------------------------------------------



# shared recursion library
# ---------------------------------------------------------------------------------------------
recursived: libclassrec.so

libclassrec.so: $(basic_obj:.o=RecPic.o) $(advancedrec_obj:.o=Pic.o)
	$(CC) -shared -o libclassrec.so $(basic_obj:.o=RecPic.o) $(advancedrec_obj:.o=Pic.o)

$(basic_obj:.o=RecPic.o): $(basic) 
	$(CC) -c -fpic -Wall -Werror $(basic) -o $(basic_obj:.o=RecPic.o) 

$(advancedrec_obj:.o=Pic.o): $(advancedrec)
	$(CC) -c -fpic -Wall -Werror $(advancedrec) -o $(advancedrec_obj:.o=Pic.o)
# ---------------------------------------------------------------------------------------------



# static loop library
# ---------------------------------------------------------------------------------------------
loops: libclassloops.a

libclassloops.a: $(basic_obj) $(advancedloops_obj)
	ar -rc libclassloops.a $(basic_obj) $(advancedloops_obj)

$(advancedloops_obj): $(advancedloops)
	$(CC) -c -Wall -Werror $(advancedloops)
# ---------------------------------------------------------------------------------------------



# static recursion library
# ---------------------------------------------------------------------------------------------
recursives: libclassrec.a

libclassrec.a: $(basic_obj) $(advancedrec_obj)
	ar -rc libclassrec.a $(basic_obj) $(advancedrec_obj)

$(advancedrec_obj): $(advancedrec)
	$(CC) -c -Wall -Werror $(advancedrec)
# ---------------------------------------------------------------------------------------------



# compile mains linked to the static recursion library
# ---------------------------------------------------------------------------------------------
mains: $(main:.c=.o) libclassrec.a
	gcc -o mains $(main:.c=.o) -L. -lclassrec

$(main:.c=.o): $(main)
	gcc -c -Wall -Werror $(main)
# ---------------------------------------------------------------------------------------------



# compile mains and link to the shared loop library
# ---------------------------------------------------------------------------------------------
maindloop: libclassloops.so $(main)
	gcc -Wall -o mains_loop $(main) libclassloops.so
# ---------------------------------------------------------------------------------------------



# compile mains and link to the shared recursion library
# ---------------------------------------------------------------------------------------------
maindrec: libclassrec.so $(main)
	gcc -Wall -o mains_rec $(main) libclassrec.so
# ---------------------------------------------------------------------------------------------



# ---------------------------------------------------------------------------------------------
clean:
	rm *a *so *o mains mains_loop mains_rec
# ---------------------------------------------------------------------------------------------

