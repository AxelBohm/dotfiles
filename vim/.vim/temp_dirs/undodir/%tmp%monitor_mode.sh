Vim�UnDo� %��T�1��J)�1u�2o��)�����*�      .echo "${monitor_mode}" > /tmp/monitor_mode.dat      +      1       1   1   1    Z�H    _�                             ����                                                                                                                                                                                                                                                                                                                                                             Z�A
     �                   5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Z�AM     �                 EXTERNAL_OUTPUT=""5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�Ap     �               �               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Z�Au     �                 EXTERNAL_OUTPUT="VGA-1"5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Z�Ay     �                 ="VGA-1"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�A�     �                 INTERNAL_OUTPUT="VGA-1"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�A�     �                 INTERNAL_OUTPUT="-1"5�_�      	                     ����                                                                                                                                                                                                                                                                                                                                                V       Z�E.     �                  �               5�_�      
           	          ����                                                                                                                                                                                                                                                                                                                                                V       Z�E6     �                 if {}5�_�   	              
          ����                                                                                                                                                                                                                                                                                                                                                V       Z�E?     �                 if }5�_�   
                        ����                                                                                                                                                                                                                                                                                                                                                V       Z�EN     �                 if 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�EQ     �                 if []5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�EX     �                 if [ ! -f ""]5�_�                       !    ����                                                                                                                                                                                                                                                                                                                                                V       Z�Eh     �                 "if [ ! -f "/tmp/monitor_mode.txt"]5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                V       Z�El     �                 #if [ ! -f "/tmp/monitor_mode.txt" ]5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �                     monitor_mode = ""5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �                     �               5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �                     monitor_mode=""5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �                   monitor_mode = "all"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �                   monitor_mode= "all"5�_�                           ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �                     �               5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �   	               �   	            5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �   
             if5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �   
               �   
            5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Z�E�     �                )elif [ $monitor_mode = "EXTERNAL" ]; then           monitor_mode="INTERNAL"   O        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F     �               )elif [ $monitor_mode = "INTERNAL" ]; then5�_�                           ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F	     �               !elif [ $monitor_mode = "" ]; then�             5�_�                       \    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F"     �               k        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT5�_�                       \    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F&     �               ]        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $T5�_�                        [    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F'     �               \        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $5�_�      !                  Z    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F'     �               [        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as 5�_�       "           !      Y    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F(     �               Z        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as5�_�   !   #           "      X    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F)     �               Y        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-a5�_�   "   $           #      W    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F)     �               X        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-5�_�   #   %           $      V    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F*     �               W        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same5�_�   $   &           %      U    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F*     �               V        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --sam5�_�   %   '           &      T    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F+     �               U        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --sa5�_�   &   (           '      S    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F+     �               T        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --s5�_�   '   )           (      R    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F,     �               S        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --5�_�   (   *           )      Q    ����                                                                                                                                                                                                                                                                                                                                                  V        Z�F-     �               R        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto -5�_�   )   ,           *           ����                                                                                                                                                                                                                                                                                                                                                  V        Z�FV    �                Q        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto 5�_�   *   -   +       ,           ����                                                                                                                                                                                                                                                                                                                                                             Z�F�     �                        monitor_mode="EXTERNAL"5�_�   ,   /           -           ����                                                                                                                                                                                                                                                                                                                                                             Z�F�     �                )elif [ $monitor_mode = "EXTERNAL" ]; then5�_�   -   0   .       /          ����                                                                                                                                                                                                                                                                                                                                                v       Z�Gr     �                       monitor_mode="CLONES"5�_�   /   1           0      +    ����                                                                                                                                                                                                                                                                                                                                                v       Z�H     �                 .echo "${monitor_mode}" > /tmp/monitor_mode.dat5�_�   0               1      +    ����                                                                                                                                                                                                                                                                                                                                                v       Z�H    �                 +echo "${monitor_mode}" > /tmp/monitor_mode.5�_�   -           /   .          ����                                                                                                                                                                                                                                                                                                                                                             Z�G`     �                       monitor_mode="clones"5�_�   *           ,   +           ����                                                                                                                                                                                                                                                                                                                                                             Z�F�     �                external_OUTPUT="VGA-1"�                        monitor_mode="external"�                O        xrandr --output $INTERNAL_OUTPUT --off --output $external_OUTPUT --auto�                )elif [ $monitor_mode = "external" ]; then�                P        xrandr --output $INTERNAL_OUTPUT --auto --output $external_OUTPUT --auto�                k        xrandr --output $INTERNAL_OUTPUT --auto --output $external_OUTPUT --auto --left-of $INTERNAL_OUTPUT5�_�                            ����                                                                                                                                                                                                                                                                                                                                                V       Z�E�     �              5��