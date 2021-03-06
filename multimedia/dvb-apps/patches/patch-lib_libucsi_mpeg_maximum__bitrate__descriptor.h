$NetBSD$

--- lib/libucsi/mpeg/maximum_bitrate_descriptor.h.orig	2011-06-28 05:50:24.000000000 +0000
+++ lib/libucsi/mpeg/maximum_bitrate_descriptor.h
@@ -52,7 +52,7 @@ static inline struct mpeg_maximum_bitrat
 	if (d->len != (sizeof(struct mpeg_maximum_bitrate_descriptor) - 2))
 		return NULL;
 
-	bswap24((uint8_t*) d + 2);
+	ubswap24((uint8_t*) d + 2);
 
 	return (struct mpeg_maximum_bitrate_descriptor*) d;
 }
