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

# create basic_obj
$(basic_obj): $(basic)
	gcc -c -Wall -Werror $(basic)


# shared loop library
# ---------------------------------------------------------------------------------------------
loopd: libclassloops.so

libclassloops.so: $(basic_obj:.o=Pic.o) $(advancedloops_obj:.o=Pic.o)
	gcc -shared -o libclassloops.so $(basic_obj:.o=Pic.o) $(advancedloops_obj:.o=Pic.o)

$(basic_obj:.o=Pic.o): $(basic) 
	gcc -c -fpic -Wall -Werror $(basic) -o $(basic_obj:.o=Pic.o) 

$(advancedloops_obj:.o=Pic.o): $(advancedloops)
	gcc -c -fpic -Wall -Werror $(advancedloops) -o $(advancedloops_obj:.o=Pic.o)
# ---------------------------------------------------------------------------------------------



# shared recursion library
# ---------------------------------------------------------------------------------------------
recursived: libclassrec.so

libclassrec.so: $(basic_obj:.o=RecPic.o) $(advancedrec_obj:.o=Pic.o)
	gcc -shared -o libclassrec.so $(basic_obj:.o=RecPic.o) $(advancedrec_obj:.o=Pic.o)

$(basic_obj:.o=RecPic.o): $(basic) 
	gcc -c -fpic -Wall -Werror $(basic) -o $(basic_obj:.o=RecPic.o) 

$(advancedrec_obj:.o=Pic.o): $(advancedrec)
	gcc -c -fpic -Wall -Werror $(advancedrec) -o $(advancedrec_obj:.o=Pic.o)
# ---------------------------------------------------------------------------------------------



# static loop library
# ---------------------------------------------------------------------------------------------
loops: libclassloops.a

libclassloops.a: $(basic_obj) $(advancedloops_obj)
	ar -rc libclassloops.a $(basic_obj) $(advancedloops_obj)

$(advancedloops_obj): $(advancedloops)
	gcc -c -Wall -Werror $(advancedloops)
# ---------------------------------------------------------------------------------------------



# static recursion library
# ---------------------------------------------------------------------------------------------
recursives: libclassrec.a

libclassrec.a: $(basic_obj) $(advancedrec_obj)
	ar -rc libclassrec.a $(basic_obj) $(advancedrec_obj)

$(advancedrec_obj): $(advancedrec)
	gcc -c -Wall -Werror $(advancedrec)
# ---------------------------------------------------------------------------------------------

# ----------------------------------------------------
clean:
	rm *a *so *o mains
# ----------------------------------------------------

