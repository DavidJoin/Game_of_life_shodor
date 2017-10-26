###############################################################################
#
# By default, include X display.
#
# Add NO_X11=1 to omit X libraries.
###############################################################################

#
# Variables and Flags
#

NO_X11 = 1

CC        = gcc

LIBS     += -lm
CFLAGS   += 
LDFLAGS  += $(LIBS)
PROGRAM   = Life
SRCS      = Life.c

ifndef NO_X11
LIBS     += -lX11
LDFLAGS  += -L/usr/X11R6/lib
else
CFLAGS   += -DNO_X11
endif

OBJS      = $(SRCS:.c=.o)		# object file

#
# Targets
#

default: all

all: $(PROGRAM) 

$(PROGRAM): $(OBJS)
	$(CC) -o $(PROGRAM) $(SRCS) $(CFLAGS) $(LDFLAGS)

clean:
	/bin/rm -f $(OBJS) $(PROGRAM)

