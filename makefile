# Variables
# compiler macro
CC = gcc

# files macro
basic = basicClassification.c
basic_obj = $(basic:.c=.o)

advancedloops = advancedClassificationLoop.c
advancedloops_obj = $(advancedloops:.c=.o)

advancedrec = advancedClassificationRecursion.c
advancedrec = $(advancedrec:.c=.o)

# main file
main = main.c


# shared loop library
# ----------------------------------------------------
loopd: libclassloops.so

libclassloops.so: $(basic_obj:.o=Pic.o) $(advancedloops_obj:.o=Pic.o)
	gcc -shared -o libclassloops.so $(basic_obj:.o=Pic.o) $(advancedloops_obj:.o=Pic.o)

$(basic_obj:.o=Pic.o): $(basic) 
	gcc -c -fpic -Wall -Werror $(basic) -o $(basic_obj:.o=Pic.o) 

$(advancedloops_obj:.o=Pic.o): $(advancedloops)
	gcc -c -fpic -Wall -Werror $(advancedloops) -o $(advancedloops_obj:.o=Pic.o)
# ----------------------------------------------------


# ----------------------------------------------------
clean:
	rm *a *so *o mains
# ----------------------------------------------------

