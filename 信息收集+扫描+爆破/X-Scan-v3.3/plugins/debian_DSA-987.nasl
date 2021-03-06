# This script was automatically generated from the dsa-987
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22853);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "987");
 script_cve_id("CVE-2006-0300");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-987 security update');
 script_set_attribute(attribute: 'description', value:
'Jim Meyering discovered several buffer overflows in GNU tar, which may
lead to the execution of arbitrary code through specially crafted tar
archives.
The old stable distribution (woody) is not affected by this problem.
For the stable distribution (sarge) this problem has been fixed in
version 1.14-2.1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-987');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your tar package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA987] DSA-987-1 tar");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-987-1 tar");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'tar', release: '3.1', reference: '1.14-2.1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
