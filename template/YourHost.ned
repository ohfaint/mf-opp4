//****************************************************************************
// * file:        YourHost.ned
// *
// * author:      Your Name
// *
// * copyright:   (C) 2004 Your Institution
// *
// *              This program is free software; you can redistribute it 
// *              and/or modify it under the terms of the GNU General Public 
// *              License as published by the Free Software Foundation; either
// *              version 2 of the License, or (at your option) any later 
// *              version.
// *              For further information see file COPYING 
// *              in the top level directory
// ***************************************************************************
// * part of:     Your Simulation
// * description: - Your Description
// *
// ***************************************************************************
// * changelog:   $Revision: 116 $
// *              last modified:   $Date: 2004-10-12 18:57:45 +0200 (Di, 12 Okt 2004) $
// *              by:              $Author: omfw-willkomm $
// ***************************************************************************/


import YourApplLayer;
import YourNetwLayer;
import YourNic;
import YourMobilityModel;
import Blackboard;


module YourHost
{
    parameters:
        // parameters for the framework
        double numHosts;

        @display("bgb=250,250,white,,;bgp=10,10");
    submodules:
        blackboard: Blackboard {
            parameters:
                @display("p=200,75;b=30,25");
        }
        mobility: YourMobilityModel {
            parameters:
                @display("p=200,150;b=30,25");
        }
        appl: YourApplLayer {
            parameters:
                @display("p=90,50;b=100,20,rect");
        }
        net: YourNetwLayer {
            parameters:
                @display("p=90,100;b=100,20,rect");
        }
        nic: YourNic {
            parameters:
                @display("p=90,150;b=100,20,rect");

        }
    connections:
        nic.uppergateOut --> net.lowergateIn;
        nic.uppergateIn <-- net.lowergateOut;

        net.uppergateOut --> appl.lowergateIn;
        net.uppergateIn <-- appl.lowergateOut;

}
