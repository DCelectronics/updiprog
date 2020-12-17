#
# Typing 'make' or 'make updiprog' will create the executable file.
#
# define some Makefile variables for the compiler and compiler flags
# to use Makefile variables later in the Makefile: $()
#
#  -g    adds debugging information to the executable file
#  -Wall turns on most, but not all, compiler warnings
#
# for C++ define  CC = g++
#
CC = gcc
CFLAGS  = -g -Wall
#
# typing 'make' will invoke the first target entry in the file 
# (in this case the default target entry)
# you can name this target entry anything, but "default" or "all"
# are the most commonly used names by convention
#
default: updiprog
#
# To create the executable file updiprog we need the object files
# app.o, com.o, devices.o, ihex.o, link.o, log.o, main.o, nvm.o, phy.o, progress.o, and sleep.o:
#
updiprog:  app.o com.o devices.o ihex.o link.o log.o main.o nvm.o phy.o progress.o sleep.o
	$(CC) $(CFLAGS) -o updiprog app.o com.o devices.o ihex.o link.o log.o main.o nvm.o phy.o progress.o sleep.o
#
# To create the object file app.o, we need the source files
# app.c, devices.h, link.h, log.h, sleep.h, and updi.h:
#
app.o: app.c devices.h link.h log.h sleep.h updi.h
	$(CC) $(CFLAGS) -c app.c
#
# To create the object file com.o, we need the source files
# com.c and com.h:
#
com.o: com.c com.h
	$(CC) $(CFLAGS) -c com.c
#
# To create the object file devices.o, we need the source files
# devices.c and devices.h :
#
devices.o: devices.c devices.h 
	$(CC) $(CFLAGS) -c devices.c
#
# To create the object file ihex.o, we need the source files
# ihex.c and ihex.h :
#
ihex.o: ihex.c ihex.h 
	$(CC) $(CFLAGS) -c ihex.c
#
# To create the object file link.o, we need the source files
# link.c, link.h, log.h, phy.h, and updi.h:
#
link.o: link.c link.h log.h phy.h updi.h
	$(CC) $(CFLAGS) -c link.c
#
# To create the object file log.o, we need the source files
# log.c and log.h:
#
log.o: log.c log.h 
	$(CC) $(CFLAGS) -c log.c
#
# To create the object file main.o, we need the source files
# main.c, link.h, log.h, nvm.h, phy.h:
#
main.o: main.c link.h log.h nvm.h phy.h
	$(CC) $(CFLAGS) -c main.c
#
# To create the object file nvm.o, we need the source files
# nvm.c, nvm.h, app.h, devices.h, ihex.h, link.h, log.h, progress.h, and updi.h :
#
nvm.o: nvm.c nvm.h app.h devices.h ihex.h link.h log.h progress.h updi.h 
	$(CC) $(CFLAGS) -c nvm.c
#
# To create the object file phy.o, we need the source files
# phy.c, phy.h, com.h, log.h, updi.h, and sleep.h:
#
phy.o: phy.c phy.h com.h log.h updi.h sleep.h
	$(CC) $(CFLAGS) -c phy.c
#
# To create the object file progress.o, we need the source files
# progress.c and devices.h:
#
progress.o:  progress.c devices.h 
	$(CC) $(CFLAGS) -c progress.c
#
# To create the object file sleep.o, we need the source files
# sleep.c and sleep.h :
#
sleep.o: sleep.c sleep.h 
	$(CC) $(CFLAGS) -c sleep.c

# To start over from scratch, type 'make clean'.  This
# removes the executable file, as well as old .o object
# files and *~ backup files:
#
clean: 
	$(RM) count *.o *~