# variables of c files test push
basic = basicClassification.c
advanced = advancedClassificationLoop.c

# get the object files
basic_obj = $(basic:.c=.o)
advanced_obj = $(advanced:.c=.o)

# the main c file
main = mains.c

# loops static library
# -------------------------------------------------------------------------
loops: libclassloops.a

libclassloops.a: $(basic_obj) $(advanced_obj) # create library
	ar -rc libclassloops.a $(basic_obj) $(advanced_obj)

$(basic_obj): $(basic)
	gcc -c -Wall $(basic)

$(advanced_obj): $(advanced)
	gcc -c -Wall $(advanced)
# -------------------------------------------------------------------------



# recursives static library
# -------------------------------------------------------------------------
recursives: libclassrec.a

libclassrec.a: $(basic_obj) $(advanced:Loop.c=Recursion.o) # create library
	ar -rc libclassrec.a $(basic_obj) $(advanced:Loop.c=Recursion.o)

$(basic_obj): $(basic)
	gcc -c -Wall $(basic)

$(advanced:Loop.c=Recursion.o): $(advanced:Loop=Recursion)
	gcc -c -Wall $(advanced:Loop.c=Recursion.c)
# -------------------------------------------------------------------------



# loops shared library
# -------------------------------------------------------------------------
loopd: libclassloops.so

libclassloops.so: $(basic_obj) $(advanced_obj)
	gcc -shared -o libclassloops.so $(basic_obj) $(advanced_obj)

$(basic_obj): $(basic)
	gcc -c -Wall -Werror -fpic $(basic)

$(advanced_obj): $(advanced)
	gcc -c -Wall -Werror -fpic $(advanced)
# -------------------------------------------------------------------------



# recursive shared library
# -------------------------------------------------------------------------
recursived: libclassrec.so

libclassrec.so: $(basic:Loop.c=Recursion.o) $(advanced:Loop.c=Recursion.o)
	gcc -shared -o libclassrec.so $(basic:Loop.c=Recursion.o) $(advanced:Loop.c=Recursion.o)

$(basic:Loop.c=Recursion.o): $(basic:Loop.c=Recursion.c)
	gcc -c -Wall -Werror -fpic $(basic:Loop.c=Recursion.c)

$(advanced:Loop.c=Recursion.o): $(advanced:Loop.c=Recursion.c)
	gcc -c -Wall -Werror -fpic $(advanced:Loop.c=Recursion.c)
# -------------------------------------------------------------------------



# mains compilation linked to recursive static library
# -------------------------------------------------------------------------
mains: recursives 
	gcc -Wall -o mains $(main) libclassrec.a
# -------------------------------------------------------------------------



# clean
# -------------------------------------------------------------------------
clean:
	rm *a *o *so mains
# -------------------------------------------------------------------------