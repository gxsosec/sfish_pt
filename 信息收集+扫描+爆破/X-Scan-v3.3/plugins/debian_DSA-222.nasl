# This script was automatically generated from the dsa-222
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15059);
 script_version("$Revision: 1.10 $");
 script_xref(name: "DSA", value: "222");
 script_cve_id("CVE-2002-1384");
 script_bugtraq_id(6475);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-222 security update');
 script_set_attribute(attribute: 'description', value:
'iDEFENSE discovered an integer overflow in the pdftops filter from the
xpdf package that can be exploited to gain the privileges of the
target user.  This can lead to gaining unauthorized access to the \'lp\'
user if the pdftops program is part of the print filter.
For the current stable distribution (woody) this problem has been
fixed in version 1.00-3.1.
For the old stable distribution (potato) this problem has been
fixed in version 0.90-8.1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-222');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your xpdf package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA222] DSA-222-1 xpdf");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-222-1 xpdf");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'xpdf', release: '2.2', reference: '0.90-8.1');
deb_check(prefix: 'xpdf', release: '3.0', reference: '1.00-3.1');
deb_check(prefix: 'xpdf-common', release: '3.0', reference: '1.00-3.1');
deb_check(prefix: 'xpdf-reader', release: '3.0', reference: '1.00-3.1');
deb_check(prefix: 'xpdf-utils', release: '3.0', reference: '1.00-3.1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
