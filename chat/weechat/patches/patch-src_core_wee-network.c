$NetBSD$

Fix for http://secunia.com/advisories/43543/

--- src/core/wee-network.c.orig	2011-01-01 13:48:17.000000000 +0000
+++ src/core/wee-network.c
@@ -94,6 +94,8 @@ network_init ()
         }
         free (ca_path);
     }
+    gnutls_certificate_set_verify_function (gnutls_xcred,
+                                            &hook_connect_gnutls_verify_certificates);
     gnutls_certificate_client_set_retrieve_function (gnutls_xcred,
                                                      &hook_connect_gnutls_set_certificates);
     network_init_ok = 1;
