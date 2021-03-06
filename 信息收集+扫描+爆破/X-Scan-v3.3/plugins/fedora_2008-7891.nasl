
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2008-7891
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(34178);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 8 2008-7891: fedora-ds-base");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2008-7891 (fedora-ds-base)");
 script_set_attribute(attribute: "description", value: "Fedora Directory Server is an LDAPv3 compliant server.  The base package includ
es
the LDAP server and command line utilities for server administration.

-
Update Information:

This is the release of Fedora Directory Server 1.1.2.    Security issues
addressed:  CVE-2008-2930 CVE-2008-3283    In addition to the CVEs listed above
,
this release fixes the following list of bugs:
[9]https://bugzilla.redhat.com/showdependencytree.cgi?id=452721&hide_resolved=0
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2008-2930", "CVE-2008-3283");
script_summary(english: "Check for the version of the fedora-ds-base package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"fedora-ds-base-1.1.2-1.fc8", release:"FC8") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
