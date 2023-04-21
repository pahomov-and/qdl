OUT := qdl

CFLAGS += -O2 -Wall -g `pkg-config --cflags libxml-2.0`
LDFLAGS += `pkg-config --libs libxml-2.0` -ludev
prefix ?= /usr/local

SRCS := firehose.c qdl.c sahara.c util.c patch.c program.c ufs.c sparse_read.c sparse.c output_stream.c backed_block.c sparse_err.c
OBJS := $(SRCS:.c=.o)

$(OUT): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(OUT) $(OBJS)

install: $(OUT)
	install -D -m 755 $< $(DESTDIR)$(prefix)/bin/$<
