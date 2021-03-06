#
#  This script was rewritten by Tenable Network Security, using a new 
#  HTTP API, and modified to be compliant with the security advisory.
#
#  Ref: Alexander Antipov <Antipov SecurityLab ru>
#


include("compat.inc");

if(description) 
{ 
  script_id(15425); 
  script_version("$Revision: 1.11 $"); 

  script_cve_id("CVE-2004-1578");
  script_bugtraq_id(11332);
  if (defined_func("script_xref")) script_xref(name:"OSVDB", value:"10512");
      
  name["english"] = "Invision Power Board Referer field XSS"; 
        
  script_name(english:name["english"]); 

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is affected by a
cross-site scripting issue." );
 script_set_attribute(attribute:"description", value:
"This version of Invision Power Board installed on the remote host is
vulnerable to cross-site scripting attacks, which may allow an attacker
to steal a user's cookies." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/fulldisclosure/2004-10/0100.html" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );
        
script_end_attributes();

        
  summary["english"] = "Checks for Invision Power Board XSS";
  script_summary(english:summary["english"]);
  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  family["english"] = "CGI abuses : XSS";
  script_family(english:family["english"]);
	
  script_dependencies("invision_power_board_detect.nasl", "cross_site_scripting.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
if(!can_host_php(port:port))exit(0);
if (get_kb_item(string("www/", port, "/generic_xss"))) exit(0);

install = get_kb_item(string("www/", port, "/invision_power_board"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (isnull(matches)) exit(0);

dir = matches[2];

test_cgi_xss(port: port, cgi: "/index.php", dirs: make_list(dir), 
 qs: "s=5875d919a790a7c429c955e4d65b5d54&act=Login&CODE=00",
 add_headers: make_array("Referer",  '"\'/><script>foo</script>'), 
 pass_re: '<input type="hidden" name="referer" value=".".\'/><script>foo</script>' );
