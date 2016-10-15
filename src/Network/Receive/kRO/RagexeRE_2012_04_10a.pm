#########################################################################
#  OpenKore - Packet Receiveing
#  This module contains functions for Receiveing packets to the server.
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#  Basically, this means that you're allowed to modify and distribute
#  this software. However, if you distribute modified versions, you MUST
#  also distribute the source code.
#  See http://www.gnu.org/licenses/gpl.html for the full license.
########################################################################
# Korea (kRO)
# The majority of private servers use eAthena, this is a clone of kRO

package Network::Receive::kRO::RagexeRE_2012_04_10a;

use strict;
use base qw(Network::Receive::kRO::RagexeRE_2012_03_07f);

sub new {
my ($class) = @_;
my $self = $class->SUPER::new(@_);
my %packets = (   
'0914' => ['actor_moved', 'v C a4 v3 V v5 a4 v6 a4 a2 v V C2 a6 C2 v2 a9 Z*', [qw(len object_type ID walk_speed opt1 opt2 option type hair_style weapon shield lowhead tick tophead midhead hair_color clothes_color head_dir costume guildID emblemID manner opt3 stance sex coords xSize ySize lv font opt4 name)]],
'0915' => ['actor_exists', 'v C a4 v3 V v11 a4 a2 v V C2 a3 C3 v2 a9 Z*', [qw(len object_type ID walk_speed opt1 opt2 option type hair_style weapon shield lowhead tophead midhead hair_color clothes_color head_dir costume guildID emblemID manner opt3 stance sex coords xSize ySize act lv font opt4 name)]],
'09DB' => ['actor_moved', 'v C a4 a4 v3 V v10 a4 a2 v V C2 a3 C3 v2 Z*', [qw(len object_type ID AID walk_speed opt1 opt2 option type hair_style weapon shield lowhead tophead midhead hair_color clothes_color head_dir guildID emblemID manner opt3 stance sex coords xSize ySize act lv font name)]],
'09DC' => ['actor_connected', 'v C a4 a4 v3 V v11 a4 a2 v V C2 a3 C2 v2 a9 Z*', [qw(len object_type ID AID walk_speed opt1 opt2 option type hair_style weapon shield lowhead tophead midhead hair_color clothes_color head_dir costume guildID emblemID manner opt3 stance sex coords xSize ySize lv font opt4 name)]],
'09DD' => ['actor_exists', 'v C a4 a4 v3 V v11 a4 a2 v V C2 a3 C3 v2 a9 Z*', [qw(len object_type ID AID walk_speed opt1 opt2 option type hair_style weapon shield lowhead tophead midhead hair_color clothes_color head_dir costume guildID emblemID manner opt3 stance sex coords xSize ySize act lv font opt4 name)]],
'08C8' => ['actor_action', 'a4 a4 a4 V3 x v C V', [qw(sourceID targetID tick src_speed dst_speed damage div type dual_wield_damage)]],
'08FF' => ['actor_status_active', 'a4 v V4', [qw(ID type tick unknown1 unknown2 unknown3)]],
'090F' => ['actor_connected', 'v C a4 v3 V v11 a4 a2 v V C2 a3 C2 v2 a9 Z*', [qw(len object_type ID walk_speed opt1 opt2 option type hair_style weapon shield lowhead tophead midhead hair_color clothes_color head_dir costume guildID emblemID manner opt3 stance sex coords xSize ySize lv font opt4 name)]],
'08C7' => ['area_spell', 'x2 a4 a4 v2 C3', [qw(ID sourceID x y type range fail)]],
);

foreach my $switch (keys %packets) {
$self->{packet_list}{$switch} = $packets{$switch};
}

return $self;
}

# TODO
# 0x08E6,4
# 0x08E8,-1
# 0x08EA,4
# 0x08EC,73
# 0x08ED,43
# 0x08EE,6
# 0x08F0,6
# 0x08F2,36
# 0x08F3,-1
# 0x08F4,6
# 0x08F6,22
# 0x08F7,3
# 0x08F8,7
# 0x08F9,6
# 0x08FA,6
# 0x0908,5

1;

=pod
//2012-04-10aRagexeRE
0x01FD,15,repairitem,2
0x089C,26,friendslistadd,2
0x0885,5,hommenu,2:4
0x0961,36,storagepassword,0
0x0288,-1,cashshopbuy,4:8
0x091C,26,partyinvite2,2
0x094B,19,wanttoconnection,2:6:10:14:18
0x0369,7,actionrequest,2:6
0x083C,10,useskilltoid,2:4:6
0x0439,8,useitem,2:4
0x0945,-1,itemlistwindowselected,2:4:8
0x0815,-1,reqopenbuyingstore,2:4:8:9:89
0x0817,2,reqclosebuyingstore,0
0x0360,6,reqclickbuyingstore,2
0x0811,-1,reqtradebuyingstore,2:4:8:12
0x0819,-1,searchstoreinfo,2:4:5:9:13:14:15
0x0835,2,searchstoreinfonextpage,0
0x0838,12,searchstoreinfolistitemclick,2:6:10
0x0437,5,walktoxy,2
0x0886,6,ticksend,2
0x0871,5,changedir,2:4
0x0938,6,takeitem,2
0x0891,6,dropitem,2:4
0x086C,8,movetokafra,2:4
0x08A6,8,movefromkafra,2:4
0x0438,10,useskilltopos,2:4:6:8
0x0366,90,useskilltoposinfo,2:4:6:8:10
0x0889,6,getcharnamerequest,2
0x0884,6,solvecharname,2
0x08E5,41,bookingregreq,2:4	//Added to prevent disconnections
0x08E6,4
0x08E7,10,bookingsearchreq,2
0x08E8,-1
0x08E9,2,bookingdelreq,2
0x08EA,4
0x08EB,39,bookingupdatereq,2
0x08EC,73
0x08ED,43
0x08EE,6
0x08EF,6,bookingignorereq,2
0x08F0,6
0x08F1,6,bookingjoinpartyreq,2
0x08F2,36
0x08F3,-1
0x08F4,6
0x08F5,-1,bookingsummonmember,2:4
0x08F6,22
0x08F7,3
0x08F8,7
0x08F9,6
0x08FA,6
0x08FB,6,bookingcanceljoinparty,2
0x0907,5,moveitem,2:4
0x0908,5
0x08D7,28,battlegroundreg,2:4 //Added to prevent disconnections
=cut