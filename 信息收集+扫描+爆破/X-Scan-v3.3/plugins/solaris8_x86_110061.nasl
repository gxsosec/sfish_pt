#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(23444);
 script_version ("$Revision: 1.10 $");
 name["english"] = "Solaris 8 (i386) : 110061-22";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"The remote host is missing Sun Security Patch number 110061-22
(SEAM 1.0.1_x86: patch for Solaris 8_x86).

Date this patch was last updated by Sun : Fri Jul 27 03:13:56 MDT 2007

You should install this patch for your system to be up-to-date." );
 script_set_attribute(attribute:"solution", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-110061-22-1" );
 script_set_attribute(attribute:"risk_factor", value:"High" );


 script_end_attributes();

 
 summary["english"] = "Check for patch 110061-22"; 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2008 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"110061-22", obsoleted_by:"", package:"SUNWkr5ma", version:"5.8.0,REV=99.12.09.18.58");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"110061-22", obsoleted_by:"", package:"SUNWkr5sl", version:"5.8.0,REV=99.12.09.21.52");
e +=  solaris_check_patch(release:"5.8_x86", arch:"i386", patch:"110061-22", obsoleted_by:"", package:"SUNWkr5sv", version:"5.8.0,REV=99.12.09.21.52");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
