$NetBSD$

--- ./libltdl/m4/libtool.m4.orig	Mon Nov 16 13:11:59 2009
+++ ./libltdl/m4/libtool.m4
@@ -2503,6 +2503,18 @@ netbsd*)
   hardcode_into_libs=yes
   ;;
 
+minix*)
+  version_type=linux
+  need_lib_prefix=no
+  need_version=no
+  library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major ${libname}${shared_ext}'
+  soname_spec='${libname}${release}${shared_ext}$major'
+  dynamic_linker='Minix ld.elf_so'
+  shlibpath_var=LD_LIBRARY_PATH
+  shlibpath_overrides_runpath=yes
+  hardcode_into_libs=yes
+  ;;
+
 newsos6)
   version_type=linux
   library_names_spec='${libname}${release}${shared_ext}$versuffix ${libname}${release}${shared_ext}$major $libname${shared_ext}'
@@ -3084,6 +3096,10 @@ netbsd*)
   fi
   ;;
 
+minix*)
+  lt_cv_deplibs_check_method='match_pattern /lib[[^/]]+(\.so|_pic\.a)$'
+  ;; 
+
 newos6*)
   lt_cv_deplibs_check_method='file_magic ELF [[0-9]][[0-9]]*-bit [[ML]]SB (executable|dynamic lib)'
   lt_cv_file_magic_cmd=/usr/bin/file
@@ -3759,6 +3775,8 @@ m4_if([$1], [CXX], [
 	;;
       netbsd*)
 	;;
+      minix*)
+        ;;
       *qnx* | *nto*)
         # QNX uses GNU C++, but need to define -shared option too, otherwise
         # it will coredump.
@@ -4438,6 +4456,11 @@ _LT_EOF
       fi
       ;;
 
+    minix*)
+      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname -o $lib'
+      _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags ${wl}-soname $wl$soname ${wl}-retain-symbols-file $wl$export_symbols -o $lib'
+      ;;
+
     solaris*)
       if $LD -v 2>&1 | $GREP 'BFD 2\.8' > /dev/null; then
 	_LT_TAGVAR(ld_shlibs, $1)=no
@@ -4852,6 +4875,13 @@ _LT_EOF
       _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
       ;;
 
+    minix*)
+      _LT_TAGVAR(archive_cmds, $1)='$LD -shared -o $lib $libobjs $deplibs $linker_flags'
+      _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
+      _LT_TAGVAR(hardcode_direct, $1)=yes
+      _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
+      ;;
+
     newsos6)
       _LT_TAGVAR(archive_cmds, $1)='$LD -G -h $soname -o $lib $libobjs $deplibs $linker_flags'
       _LT_TAGVAR(hardcode_direct, $1)=yes
@@ -6017,6 +6047,10 @@ if test "$_lt_caught_CXX_error" != yes; then
 	# Workaround some broken pre-1.5 toolchains
 	output_verbose_link_cmd='$CC -shared $CFLAGS -v conftest.$objext 2>&1 | $GREP conftest.$objext | $SED -e "s:-lgcc -lc -lgcc::"'
 	;;
+
+      minix*)
+        _LT_TAGVAR(ld_shlibs, $1)=yes 
+        ;;
 
       *nto* | *qnx*)
         _LT_TAGVAR(ld_shlibs, $1)=yes
