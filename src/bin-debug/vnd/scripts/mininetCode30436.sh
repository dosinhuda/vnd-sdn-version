#!/usr/bin/python

"""
Script created by VND - Visual Network Description (SDN version)
"""
from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSKernelSwitch, IVSSwitch, UserSwitch
from mininet.link import Link, TCLink
from mininet.cli import CLI
from mininet.log import setLogLevel

def topology():

    "Create a network."
    net = Mininet( controller=RemoteController, link=TCLink, switch=OVSKernelSwitch )

    print "*** Creating nodes"
    ap1 = net.addBaseStation( 'ap1', ssid= 'new-ssid', mode= 'g', channel= '1', position='419,144,0' )
    sta2 = net.addStation( 'sta2', wlans=1, mac='00:02:00:00:00:02', ip='10.0.0.2/8', position='344,448,0' )
    sta3 = net.addStation( 'sta3', wlans=1, mac='00:02:00:00:00:03', ip='10.0.0.3/8', position='853,365,0' )

    print "*** Creating links"
    net.addLink(sta2, ap1)
    net.addLink(ap1, sta3)

    print "*** Starting network"
    net.build()

net.plotGraph(max_x=873+, max_y=385)

    print "*** Running CLI"
    CLI( net )

    print "*** Stopping network"
    net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    topology()

