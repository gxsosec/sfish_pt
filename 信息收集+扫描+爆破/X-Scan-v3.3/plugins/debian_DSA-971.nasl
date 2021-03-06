# This script was automatically generated from the dsa-971
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22837);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "971");
 script_cve_id("CVE-2006-0301");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-971 security update');
 script_set_attribute(attribute: 'description', value:
'SuSE researchers discovered heap overflow errors in xpdf, the Portable
Document Format (PDF) suite, that can allow attackers to cause a
denial of service by crashing the application or possibly execute
arbitrary code.
The old stable distribution (woody) is not affected.
For the stable distribution (sarge) these problems have been fixed in
version 3.00-13.5.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-971');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your xpdf packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA971] DSA-971-1 xpdf");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-971-1 xpdf");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'xpdf', release: '3.1', reference: '3.00-13.5');
deb_check(prefix: 'xpdf-common', release: '3.1', reference: '3.00-13.5');
deb_check(prefix: 'xpdf-reader', release: '3.1', reference: '3.00-13.5');
deb_check(prefix: 'xpdf-utils', release: '3.1', reference: '3.00-13.5');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
