# This script was automatically generated from the dsa-352
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15189);
 script_version("$Revision: 1.11 $");
 script_xref(name: "DSA", value: "352");
 script_cve_id("CVE-2003-0596");
 script_bugtraq_id(8247);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-352 security update');
 script_set_attribute(attribute: 'description', value:
'fdclone creates a temporary directory in /tmp as a workspace.
However, if this directory already exists, the existing directory is
used instead, regardless of its ownership or permissions.  This would
allow an attacker to gain access to fdclone\'s temporary files and
their contents, or replace them with other files under the attacker\'s
control.
For the stable distribution (woody) this problem has been fixed in
version 2.00a-1woody3.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-352');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2003/dsa-352
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA352] DSA-352-1 fdclone");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-352-1 fdclone");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'fdclone', release: '3.0', reference: '2.00a-1woody3');
if (deb_report_get()) security_note(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
