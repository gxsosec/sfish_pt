
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2007-0001
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(27648);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 7 2007-0001: firefox");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2007-0001 (firefox)");
 script_set_attribute(attribute: "description", value: "Mozilla Firefox is an open-source web browser, designed for standards
compliance, performance and portability.

-
Update Information:

Updated firefox packages that fix several security bugs are now available for F
edora Core 7.

This update has been rated as having critical security impact by the Fedora Sec
urity Response Team.

Mozilla Firefox is an open source Web browser.

Several flaws were found in the way Firefox processed certain malformed JavaScr
ipt code. A web page containing malicious JavaScript code could cause Firefox t
o crash or potentially execute arbitrary code as the user running Firefox. (CVE
-2007-2867, CVE-2007-2868)

A flaw was found in the way Firefox handled certain FTP PASV commands. A malici
ous FTP server could use this flaw to perform a rudimentary port-scan of machin
es behind a user's firewall. (CVE-2007-1562)

Several denial of service flaws were found in the way Firefox handled certain f
orm and cookie data. A malicious web site that is able to set arbitrary form an
d cookie data could prevent Firefox from functioning properly. (CVE-2007-1362,
CVE-2007-2869)

A flaw was found in the way Firefox handled the addEventListener JavaScript met
hod. A malicious web site could use this method to access or modify sensitive d
ata from another web site. (CVE-2007-2870)

A flaw was found in the way Firefox displayed certain web content. A malicious
web page could generate content that would overlay user interface elements such
as the hostname and security indicators, tricking users into thinking they are
visiting a different site. (CVE-2007-2871)

Users of Firefox are advised to upgrade to these erratum packages, which contai
n Firefox version 2.0.0.4 that corrects these issues.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2007-1362", "CVE-2007-1562", "CVE-2007-2867", "CVE-2007-2868", "CVE-2007-2869", "CVE-2007-2870", "CVE-2007-2871");
script_summary(english: "Check for the version of the firefox package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"firefox-2.0.0.4-1.fc7", release:"FC7") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
