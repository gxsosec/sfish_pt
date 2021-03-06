# This script was automatically generated from the dsa-615
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(16025);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "615");
 script_cve_id("CVE-2004-1179");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-615 security update');
 script_set_attribute(attribute: 'description', value:
'Javier Fern�ndez-Sanguino Pe�a from the Debian Security Audit Project
noticed that the debstd script from
debmake, a deprecated helper package for Debian packaging, created
temporary directories in an insecure manner.  This can be exploited by
a malicious user to overwrite arbitrary files owned by the victim.
For the stable distribution (woody) this problem has been fixed in
version 3.6.10.woody.1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2004/dsa-615');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your debmake package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA615] DSA-615-1 debmake");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-615-1 debmake");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'debmake', release: '3.0', reference: '3.6.10.woody.1');
if (deb_report_get()) security_note(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
