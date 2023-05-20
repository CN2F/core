from mininet.topo import Topo
protos = "OpenFlow13"


class onostopo( Topo ):
    def build( self ):

        sl = self.addSwitch( 'sl', protocols=protos, dpid="101" )
        sr = self.addSwitch( 'sr', protocols=protos, dpid="102" )
        smid=self.addSwitch( 'smid', protocols=protos, dpid="001")

        # Add links
        self.addLink( sl, sr, port1=258, port2=257 )
        self.addLink(smid, sl, port1=257, port2=1)
        self.addLink(smid, sr, port1=258, port2=1)

topos = { 'onostopo': ( lambda: onostopo() ) }
