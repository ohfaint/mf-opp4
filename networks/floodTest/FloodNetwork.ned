//***************************************************************************
//* file:        FloodNetwork.ned
//*
//* author:      Daniel Willkomm
//*
//* copyright:   (C) 2004 Telecommunication Networks Group (TKN) at
//*              Technische Universitaet Berlin, Germany.
//*
//*              This program is free software; you can redistribute it 
//*              and/or modify it under the terms of the GNU General Public 
//*              License as published by the Free Software Foundation; either
//*              version 2 of the License, or (at your option) any later 
//*              version.
//*              For further information see file COPYING 
//*              in the top level directory
//***************************************************************************
//* part of:     framework implementation developed by tkn
//* description: FloodNetwork Compound Module
//*
//***************************************************************************
//* changelog:   $Revision: 103 $
//*              last modified:   $Date: 2004-09-23 09:56:00 +0200 (Do, 23 Sep 2004) $
//*              by:              $Author: omfw-willkomm $
//***************************************************************************

package org.mf2.networks.floodTest;

import org.mf2.core.channelControl.ChannelControl;


module FloodNetwork
{
    parameters:
        // parametes for the framework
        double playgroundSizeX;
        double playgroundSizeY;
        double numHosts;


        @display("bgb=$playgroundSizeX,$playgroundSizeY,white,,;bgp=5,5");
    submodules:
        channelcontrol: ChannelControl {
            parameters:
                playgroundSizeX = playgroundSizeX;
                playgroundSizeY = playgroundSizeY;
                @display("p=50,25");
        }
        host[numHosts]: FloodHost {
            parameters:
                @display("p=119,94");

        }
    connections allowunconnected:
    // all connections and gates are to be generated dynamically

}




network floodSim extends FloodNetwork
{
    parameters:
        playgroundSizeX @prompt("playgroundSizeX") = default(40);
        playgroundSizeY @prompt("playgroundSizeY") = default(40);
        numHosts @prompt("Number of hosts:") = default(2);

}
