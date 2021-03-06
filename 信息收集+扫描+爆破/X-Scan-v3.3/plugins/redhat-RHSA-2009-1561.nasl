
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(42432);
 script_version ("$Revision: 1.1 $");
 script_name(english: "RHSA-2009-1561: libvorbis");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2009-1561");
 script_set_attribute(attribute: "description", value: '
  Updated libvorbis packages that fix multiple security issues are now
  available for Red Hat Enterprise Linux 3, 4, and 5.

  This update has been rated as having important security impact by the Red
  Hat Security Response Team.

  The libvorbis packages contain runtime libraries for use in programs that
  support Ogg Vorbis. Ogg Vorbis is a fully open, non-proprietary, patent-and
  royalty-free, general-purpose compressed audio format.

  Multiple flaws were found in the libvorbis library. A specially-crafted Ogg
  Vorbis media format file (Ogg) could cause an application using libvorbis
  to crash or, possibly, execute arbitrary code when opened. (CVE-2009-3379)

  Users of libvorbis should upgrade to these updated packages, which contain
  backported patches to correct these issues. The desktop must be restarted
  (log out, then log back in) for this update to take effect.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2009-1561.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2009-3379");
script_summary(english: "Check for the version of the libvorbis packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"libvorbis-1.1.2-3.el5_4.4", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-devel-1.1.2-3.el5_4.4", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-1.0-12.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-devel-1.0-12.el3", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-1.1.0-3.el4_8.3", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-devel-1.1.0-3.el4_8.3", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-1.1.0-3.el4_8.3", release:'RHEL4.8.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-devel-1.1.0-3.el4_8.3", release:'RHEL4.8.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-1.1.2-3.el5_4.4", release:'RHEL5.4.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libvorbis-devel-1.1.2-3.el5_4.4", release:'RHEL5.4.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
