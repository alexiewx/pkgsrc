$NetBSD$

--- ipc/chromium/src/build/build_config.h.orig	2011-12-20 23:28:19.000000000 +0000
+++ ipc/chromium/src/build/build_config.h
@@ -19,6 +19,10 @@
 #define OS_MACOSX 1
 #elif defined(__linux__) || defined(ANDROID)
 #define OS_LINUX 1
+#elif defined(__NetBSD__)
+#define OS_NETBSD 1
+#elif defined(__DragonFly__)
+#define OS_DRAGONFLY 1
 #elif defined(__OpenBSD__)
 #define OS_OPENBSD 1
 #elif defined(_WIN32)
@@ -29,7 +33,7 @@
 
 // For access to standard POSIX features, use OS_POSIX instead of a more
 // specific macro.
-#if defined(OS_MACOSX) || defined(OS_LINUX) || defined(OS_OPENBSD)
+#if defined(OS_MACOSX) || defined(OS_LINUX) || defined(OS_BSD)
 #define OS_POSIX 1
 #endif
 
